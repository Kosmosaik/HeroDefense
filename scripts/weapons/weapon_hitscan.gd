extends Node3D
class_name WeaponHitscan

signal fired(hit: bool, hit_position: Vector3, hit_normal: Vector3, collider: Node)
signal damage_applied(target: Node, amount: float)

enum TriggerMode {
	SEMI_AUTO,
	FULL_AUTO
}

@export_category("Weapon")
@export var weapon_name: String = "Prototype Rifle"
@export var trigger_mode: TriggerMode = TriggerMode.FULL_AUTO
@export_range(0.5, 30.0, 0.1) var fire_rate: float = 8.0
@export var damage: float = 25.0
@export var max_range: float = 250.0
@export_flags_3d_physics var hit_mask: int = 1

@onready var muzzle: Marker3D = $Muzzle

var _owner: Node = null
var _camera: Camera3D = null
var _trigger_held: bool = false
var _queued_single_shot: bool = false
var _cooldown_remaining: float = 0.0


func setup(weapon_owner: Node, camera: Camera3D) -> void:
	_owner = weapon_owner
	_camera = camera


func set_trigger_held(is_held: bool) -> void:
	_trigger_held = is_held


func queue_single_shot() -> void:
	_queued_single_shot = true


func _physics_process(delta: float) -> void:
	if _cooldown_remaining > 0.0:
		_cooldown_remaining = max(_cooldown_remaining - delta, 0.0)

	var wants_to_fire := false

	match trigger_mode:
		TriggerMode.FULL_AUTO:
			wants_to_fire = _trigger_held
		TriggerMode.SEMI_AUTO:
			wants_to_fire = _queued_single_shot

	if wants_to_fire:
		_try_fire()

	_queued_single_shot = false


func _try_fire() -> void:
	if _camera == null or _owner == null:
		return

	if _cooldown_remaining > 0.0:
		return

	_cooldown_remaining = 1.0 / fire_rate

	var viewport_size := get_viewport().get_visible_rect().size
	var screen_center := viewport_size * 0.5

	var ray_origin := _camera.project_ray_origin(screen_center)
	var ray_end := ray_origin + _camera.project_ray_normal(screen_center) * max_range

	var query := PhysicsRayQueryParameters3D.create(
		ray_origin,
		ray_end,
		hit_mask,
		[_owner.get_rid()]
	)

	var result := get_world_3d().direct_space_state.intersect_ray(query)

	if result.is_empty():
		fired.emit(false, ray_end, Vector3.ZERO, null)
		return

	var collider := result["collider"] as Node
	var hit_position: Vector3 = result["position"]
	var hit_normal: Vector3 = result["normal"]

	_apply_damage(collider, hit_position, hit_normal)
	fired.emit(true, hit_position, hit_normal, collider)


func _apply_damage(collider: Node, hit_position: Vector3, hit_normal: Vector3) -> void:
	if collider == null:
		return

	if collider.has_method("take_damage"):
		collider.take_damage(damage, _owner, hit_position, hit_normal)
		damage_applied.emit(collider, damage)
		return

	var health_node := collider.get_node_or_null("Health")
	if health_node != null and health_node.has_method("take_damage"):
		health_node.take_damage(damage, _owner, hit_position, hit_normal)
		damage_applied.emit(collider, damage)
