extends Node
class_name HealthComponent

signal damaged(previous_health: float, current_health: float, amount: float, instigator: Node, hit_position: Vector3, hit_normal: Vector3)
signal healed(previous_health: float, current_health: float, amount: float)
signal died(instigator: Node, hit_position: Vector3, hit_normal: Vector3)

@export_category("Health")
@export var max_health: float = 100.0

var current_health: float = 0.0


func _ready() -> void:
	reset_health()


func reset_health() -> void:
	current_health = max_health


func is_dead() -> bool:
	return current_health <= 0.0


func take_damage(
	amount: float,
	instigator: Node = null,
	hit_position: Vector3 = Vector3.ZERO,
	hit_normal: Vector3 = Vector3.UP
) -> void:
	if amount <= 0.0 or is_dead():
		return

	var previous_health := current_health
	current_health = max(current_health - amount, 0.0)

	damaged.emit(previous_health, current_health, amount, instigator, hit_position, hit_normal)

	if current_health <= 0.0:
		died.emit(instigator, hit_position, hit_normal)


func heal(amount: float) -> void:
	if amount <= 0.0 or is_dead():
		return

	var previous_health := current_health
	current_health = min(current_health + amount, max_health)

	if current_health > previous_health:
		healed.emit(previous_health, current_health, current_health - previous_health)
