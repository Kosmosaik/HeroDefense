extends Node
class_name WaveManager

signal run_started(total_waves: int)
signal intermission_started(next_wave: int, duration: float)
signal wave_started(wave: int, total_waves: int, total_enemies: int)
signal wave_progress_changed(wave: int, total_waves: int, alive_enemies: int, remaining_to_spawn: int, total_enemies: int)
signal wave_cleared(wave: int, total_waves: int)
signal run_completed(total_waves: int)
signal run_stopped

enum Phase {
	IDLE,
	INTERMISSION,
	WAVE_ACTIVE,
	COMPLETE,
	STOPPED
}

@export_category("Scene References")
@export var enemy_scene: PackedScene
@export var spawn_points_root: Node3D
@export var enemies_parent: Node3D

@export_category("Wave Flow")
@export var total_waves: int = 5
@export var first_wave_delay: float = 2.0
@export var intermission_duration: float = 5.0
@export var spawn_interval: float = 0.45

@export_category("Wave Scaling")
@export var starting_enemy_count: int = 4
@export var enemy_count_increase_per_wave: int = 2

var _rng := RandomNumberGenerator.new()
var _phase: Phase = Phase.IDLE
var _current_wave: int = 0
var _current_wave_total_enemies: int = 0
var _remaining_to_spawn: int = 0
var _spawn_timer: float = 0.0
var _phase_timer: float = 0.0
var _active_enemy_ids: Dictionary = {}
var _spawn_points: Array[Node3D] = []


func _ready() -> void:
	_rng.randomize()


func start_run() -> void:
	if enemy_scene == null:
		push_error("WaveManager: enemy_scene is not assigned.")
		return

	if spawn_points_root == null:
		push_error("WaveManager: spawn_points_root is not assigned.")
		return

	if enemies_parent == null:
		push_error("WaveManager: enemies_parent is not assigned.")
		return

	_cache_spawn_points()

	if _spawn_points.is_empty():
		push_error("WaveManager: no spawn points found under spawn_points_root.")
		return

	cleanup_spawned_enemies()

	_active_enemy_ids.clear()
	_current_wave = 0
	_current_wave_total_enemies = 0
	_remaining_to_spawn = 0
	_spawn_timer = 0.0
	_phase_timer = max(first_wave_delay, 0.0)
	_phase = Phase.INTERMISSION

	run_started.emit(total_waves)
	intermission_started.emit(1, _phase_timer)


func stop_run(clear_enemies: bool = false) -> void:
	if _phase == Phase.STOPPED:
		return

	_phase = Phase.STOPPED
	_phase_timer = 0.0
	_remaining_to_spawn = 0

	if clear_enemies:
		cleanup_spawned_enemies()

	run_stopped.emit()


func cleanup_spawned_enemies() -> void:
	if enemies_parent == null:
		return

	for child in enemies_parent.get_children():
		child.queue_free()

	_active_enemy_ids.clear()


func get_current_wave() -> int:
	return _current_wave


func get_total_waves() -> int:
	return total_waves


func get_alive_enemy_count() -> int:
	return _active_enemy_ids.size()


func get_remaining_to_spawn() -> int:
	return _remaining_to_spawn


func get_current_wave_total_enemies() -> int:
	return _current_wave_total_enemies


func _process(delta: float) -> void:
	match _phase:
		Phase.INTERMISSION:
			_process_intermission(delta)
		Phase.WAVE_ACTIVE:
			_process_wave(delta)


func _process_intermission(delta: float) -> void:
	_phase_timer = max(_phase_timer - delta, 0.0)

	if _phase_timer == 0.0:
		_start_next_wave()


func _process_wave(delta: float) -> void:
	if _remaining_to_spawn > 0:
		_spawn_timer -= delta

		while _remaining_to_spawn > 0 and _spawn_timer <= 0.0:
			_spawn_one_enemy()
			_remaining_to_spawn -= 1
			_spawn_timer += max(spawn_interval, 0.01)
			_emit_wave_progress()

	if _remaining_to_spawn == 0 and _active_enemy_ids.is_empty():
		_finish_current_wave()


func _start_next_wave() -> void:
	_current_wave += 1
	_current_wave_total_enemies = starting_enemy_count + ((_current_wave - 1) * enemy_count_increase_per_wave)
	_remaining_to_spawn = _current_wave_total_enemies
	_spawn_timer = 0.0
	_phase = Phase.WAVE_ACTIVE

	wave_started.emit(_current_wave, total_waves, _current_wave_total_enemies)
	_emit_wave_progress()


func _finish_current_wave() -> void:
	wave_cleared.emit(_current_wave, total_waves)

	if _current_wave >= total_waves:
		_phase = Phase.COMPLETE
		run_completed.emit(total_waves)
		return

	_phase = Phase.INTERMISSION
	_phase_timer = max(intermission_duration, 0.0)
	intermission_started.emit(_current_wave + 1, _phase_timer)


func _spawn_one_enemy() -> void:
	if _spawn_points.is_empty():
		return

	var spawn_point := _spawn_points[_rng.randi_range(0, _spawn_points.size() - 1)]
	var enemy := enemy_scene.instantiate()

	if not enemy is Node3D:
		push_error("WaveManager: enemy_scene root must inherit Node3D.")
		return

	enemies_parent.add_child(enemy)

	var enemy_node := enemy as Node3D
	enemy_node.global_position = spawn_point.global_position
	enemy_node.global_rotation = spawn_point.global_rotation

	_register_enemy(enemy)


func _register_enemy(enemy: Node) -> void:
	var enemy_id := enemy.get_instance_id()
	_active_enemy_ids[enemy_id] = enemy

	enemy.tree_exited.connect(_on_enemy_tree_exited.bind(enemy_id))

	if enemy.has_signal("died"):
		enemy.connect("died", Callable(self, "_on_enemy_died"))

	_emit_wave_progress()


func _on_enemy_died(enemy: Node) -> void:
	_unregister_enemy(enemy.get_instance_id())


func _on_enemy_tree_exited(enemy_id: int) -> void:
	_unregister_enemy(enemy_id)


func _unregister_enemy(enemy_id: int) -> void:
	if not _active_enemy_ids.has(enemy_id):
		return

	_active_enemy_ids.erase(enemy_id)
	_emit_wave_progress()


func _emit_wave_progress() -> void:
	wave_progress_changed.emit(
		_current_wave,
		total_waves,
		_active_enemy_ids.size(),
		_remaining_to_spawn,
		_current_wave_total_enemies
	)


func _cache_spawn_points() -> void:
	_spawn_points.clear()

	for child in spawn_points_root.get_children():
		if child is Node3D:
			_spawn_points.append(child)
