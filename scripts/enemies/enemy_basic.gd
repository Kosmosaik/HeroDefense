extends CharacterBody3D
class_name EnemyBasic

signal died(enemy: EnemyBasic)

enum State {
	IDLE,
	CHASING,
	ATTACKING,
	DEAD
}

@export_category("Movement")
@export var move_speed: float = 3.8
@export var acceleration: float = 16.0
@export var gravity_scale: float = 1.0
@export var target_refresh_interval: float = 0.20
@export var player_detection_radius: float = 6.0
@export var rotation_speed: float = 10.0

@export_category("Combat")
@export var attack_range: float = 1.5
@export var attack_damage: float = 12.0
@export var attack_interval: float = 1.0

@export_category("Visuals")
@export var alive_color: Color = Color(0.75, 0.20, 0.20, 1.0)
@export var hurt_color: Color = Color(1.0, 0.55, 0.55, 1.0)
@export var dead_color: Color = Color(0.10, 0.10, 0.10, 1.0)
@export var hurt_flash_duration: float = 0.08

@export_category("Death")
@export var destroy_on_death: bool = true
@export var destroy_delay: float = 0.20

@onready var navigation_agent: NavigationAgent3D = $NavigationAgent3D
@onready var mesh_instance: MeshInstance3D = $MeshInstance3D
@onready var health: HealthComponent = $Health
@onready var attack_origin: Marker3D = $AttackOrigin

var _gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
var _state: State = State.IDLE
var _current_target: Node = null
var _target_refresh_timer: float = 0.0
var _attack_cooldown_remaining: float = 0.0
var _hurt_flash_timer: float = 0.0
var _is_dead: bool = false


func _ready() -> void:
	add_to_group("enemies")

	_prepare_material()
	_set_color(alive_color)

	health.damaged.connect(_on_damaged)
	health.died.connect(_on_died)

	# Keep these close to the actor size and melee behavior.
	navigation_agent.path_desired_distance = 0.35
	navigation_agent.target_desired_distance = 0.75

	# Wait one frame so the nav map has time to sync.
	call_deferred("_finish_setup")


func _finish_setup() -> void:
	_refresh_target(true)


func _process(delta: float) -> void:
	if _is_dead:
		return

	if _hurt_flash_timer > 0.0:
		_hurt_flash_timer = max(_hurt_flash_timer - delta, 0.0)
		if _hurt_flash_timer == 0.0:
			_set_color(alive_color)


func _physics_process(delta: float) -> void:
	if _is_dead:
		return

	_update_timers(delta)
	_apply_gravity(delta)

	# Reevaluate targets periodically, even if the current target is still alive.
	if _target_refresh_timer <= 0.0:
		_refresh_target(true)

	if _current_target == null or not _node_is_alive(_current_target):
		_state = State.IDLE
		_slow_horizontal_velocity(delta)
		move_and_slide()
		return

	var target_position := _get_node_target_position(_current_target)

	if _is_target_in_attack_range(target_position):
		_state = State.ATTACKING
		_slow_horizontal_velocity(delta)
		_face_toward(target_position, delta)
		_try_attack(target_position)
	else:
		_state = State.CHASING
		_move_along_path(delta)

	move_and_slide()


func is_alive() -> bool:
	return not _is_dead


func take_damage(
	amount: float,
	instigator: Node = null,
	hit_position: Vector3 = Vector3.ZERO,
	hit_normal: Vector3 = Vector3.UP
) -> void:
	health.take_damage(amount, instigator, hit_position, hit_normal)


func _update_timers(delta: float) -> void:
	if _attack_cooldown_remaining > 0.0:
		_attack_cooldown_remaining = max(_attack_cooldown_remaining - delta, 0.0)

	if _target_refresh_timer > 0.0:
		_target_refresh_timer = max(_target_refresh_timer - delta, 0.0)


func _apply_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= _gravity * gravity_scale * delta


func _move_along_path(delta: float) -> void:
	var next_path_position := navigation_agent.get_next_path_position()
	var move_vector := next_path_position - global_position
	move_vector.y = 0.0

	if move_vector.length_squared() <= 0.0001:
		_slow_horizontal_velocity(delta)
		return

	var move_direction := move_vector.normalized()
	var target_velocity := move_direction * move_speed

	velocity.x = move_toward(velocity.x, target_velocity.x, acceleration * delta)
	velocity.z = move_toward(velocity.z, target_velocity.z, acceleration * delta)

	_face_toward(global_position + move_direction, delta)


func _slow_horizontal_velocity(delta: float) -> void:
	velocity.x = move_toward(velocity.x, 0.0, acceleration * delta)
	velocity.z = move_toward(velocity.z, 0.0, acceleration * delta)


func _face_toward(target_position: Vector3, delta: float) -> void:
	var flat_direction := target_position - global_position
	flat_direction.y = 0.0

	if flat_direction.length_squared() <= 0.0001:
		return

	var target_yaw := atan2(flat_direction.x, flat_direction.z)
	rotation.y = lerp_angle(rotation.y, target_yaw, rotation_speed * delta)


func _refresh_target(force_navigation_refresh: bool = false) -> void:
	_current_target = _choose_target()
	_target_refresh_timer = target_refresh_interval

	if force_navigation_refresh and _current_target != null:
		navigation_agent.target_position = _get_node_target_position(_current_target)


func _choose_target() -> Node:
	var player_target := _find_nearest_valid_player()
	if player_target != null:
		return player_target

	var base_target := get_tree().get_first_node_in_group("base_objective")
	if base_target != null and _node_is_alive(base_target):
		return base_target

	return null


func _find_nearest_valid_player() -> Node:
	var best_player: Node = null
	var best_distance_sq := player_detection_radius * player_detection_radius

	for candidate in get_tree().get_nodes_in_group("players"):
		if not _node_is_alive(candidate):
			continue

		var candidate_position := _get_node_target_position(candidate)
		var distance_sq := _flat_distance_squared(global_position, candidate_position)

		if distance_sq <= best_distance_sq:
			best_distance_sq = distance_sq
			best_player = candidate

	return best_player


func _is_target_in_attack_range(target_position: Vector3) -> bool:
	return _flat_distance_squared(global_position, target_position) <= attack_range * attack_range


func _try_attack(target_position: Vector3) -> void:
	if _attack_cooldown_remaining > 0.0:
		return

	_attack_cooldown_remaining = attack_interval

	if _current_target == null:
		return

	if _current_target.has_method("take_damage"):
		var hit_normal := (target_position - attack_origin.global_position).normalized()
		_current_target.call("take_damage", attack_damage, self, target_position, hit_normal)


func _node_is_alive(node: Node) -> bool:
	if node == null or not is_instance_valid(node):
		return false

	if node.has_method("is_alive"):
		return bool(node.call("is_alive"))

	return true


func _get_node_target_position(node: Node) -> Vector3:
	if node == null or not is_instance_valid(node):
		return global_position

	if node.has_method("get_target_position"):
		return node.call("get_target_position")

	if node is Node3D:
		return node.global_position

	return global_position


func _flat_distance_squared(a: Vector3, b: Vector3) -> float:
	var delta := a - b
	delta.y = 0.0
	return delta.length_squared()


func _on_damaged(
	_previous_health: float,
	_current_health: float,
	_amount: float,
	_instigator: Node,
	_hit_position: Vector3,
	_hit_normal: Vector3
) -> void:
	_hurt_flash_timer = hurt_flash_duration
	_set_color(hurt_color)


func _on_died(
	_instigator: Node,
	_hit_position: Vector3,
	_hit_normal: Vector3
) -> void:
	_is_dead = true
	_state = State.DEAD
	velocity = Vector3.ZERO

	collision_layer = 0
	collision_mask = 0

	_set_color(dead_color)
	died.emit(self)

	if destroy_on_death:
		_destroy_after_delay()


func _destroy_after_delay() -> void:
	var timer := get_tree().create_timer(destroy_delay)
	await timer.timeout
	queue_free()


func _prepare_material() -> void:
	if mesh_instance.material_override == null:
		mesh_instance.material_override = StandardMaterial3D.new()
	else:
		mesh_instance.material_override = mesh_instance.material_override.duplicate()


func _set_color(color: Color) -> void:
	var material := mesh_instance.material_override as BaseMaterial3D
	if material != null:
		material.albedo_color = color
