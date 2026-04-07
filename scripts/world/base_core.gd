extends StaticBody3D
class_name BaseCore

signal destroyed

@export_category("Visuals")
@export var alive_color: Color = Color(0.22, 0.52, 0.95, 1.0)
@export var hurt_color: Color = Color(1.0, 0.45, 0.25, 1.0)
@export var dead_color: Color = Color(0.12, 0.12, 0.12, 1.0)
@export var hurt_flash_duration: float = 0.08

@onready var mesh_instance: MeshInstance3D = $MeshInstance3D
@onready var health: HealthComponent = $Health
@onready var target_point: Marker3D = $TargetPoint

var _hurt_flash_timer: float = 0.0
var _is_destroyed: bool = false


func _ready() -> void:
	add_to_group("base_objective")

	_prepare_material()
	_set_color(alive_color)

	health.damaged.connect(_on_damaged)
	health.died.connect(_on_died)


func _process(delta: float) -> void:
	if _is_destroyed:
		return

	if _hurt_flash_timer > 0.0:
		_hurt_flash_timer = max(_hurt_flash_timer - delta, 0.0)
		if _hurt_flash_timer == 0.0:
			_set_color(alive_color)


func is_alive() -> bool:
	return not _is_destroyed


func get_target_position() -> Vector3:
	return target_point.global_position


func take_damage(
	amount: float,
	instigator: Node = null,
	hit_position: Vector3 = Vector3.ZERO,
	hit_normal: Vector3 = Vector3.UP
) -> void:
	health.take_damage(amount, instigator, hit_position, hit_normal)


func _on_damaged(
	previous_health: float,
	current_health: float,
	amount: float,
	instigator: Node,
	hit_position: Vector3,
	hit_normal: Vector3
) -> void:
	_hurt_flash_timer = hurt_flash_duration
	_set_color(hurt_color)


func _on_died(
	instigator: Node,
	hit_position: Vector3,
	hit_normal: Vector3
) -> void:
	_is_destroyed = true
	_set_color(dead_color)
	destroyed.emit()


func _prepare_material() -> void:
	if mesh_instance.material_override == null:
		mesh_instance.material_override = StandardMaterial3D.new()
	else:
		mesh_instance.material_override = mesh_instance.material_override.duplicate()


func _set_color(color: Color) -> void:
	var material := mesh_instance.material_override as BaseMaterial3D
	if material != null:
		material.albedo_color = color
