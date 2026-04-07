extends Node3D

enum RunState {
	ACTIVE,
	FAILED,
	WON
}

@onready var player: CharacterBody3D = $Player
@onready var player_health: HealthComponent = $Player/Health
@onready var base_core: BaseCore = $BaseCore
@onready var base_health: HealthComponent = $BaseCore/Health
@onready var wave_manager: WaveManager = $WaveManager
@onready var hud: PrototypeHUD = $HUD

var _run_state: RunState = RunState.ACTIVE
var _message_token: int = 0


func _ready() -> void:
	player_health.changed.connect(_on_player_health_changed)
	base_health.changed.connect(_on_base_health_changed)

	player.died.connect(_on_player_died)
	base_core.destroyed.connect(_on_base_destroyed)

	wave_manager.run_started.connect(_on_run_started)
	wave_manager.intermission_started.connect(_on_intermission_started)
	wave_manager.wave_started.connect(_on_wave_started)
	wave_manager.wave_progress_changed.connect(_on_wave_progress_changed)
	wave_manager.wave_cleared.connect(_on_wave_cleared)
	wave_manager.run_completed.connect(_on_run_completed)

	_refresh_hud()
	wave_manager.start_run()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("restart_run"):
		if _run_state != RunState.ACTIVE or not player.is_alive():
			get_tree().reload_current_scene()


func _refresh_hud() -> void:
	hud.set_player_health(player_health.current_health, player_health.max_health)
	hud.set_base_health(base_health.current_health, base_health.max_health)
	hud.set_wave_info(wave_manager.get_current_wave(), wave_manager.get_total_waves())
	hud.set_enemy_info(wave_manager.get_alive_enemy_count(), wave_manager.get_remaining_to_spawn())


func _freeze_player() -> void:
	player.set_physics_process(false)
	player.set_process_unhandled_input(false)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_player_health_changed(current_health: float, max_health: float) -> void:
	hud.set_player_health(current_health, max_health)


func _on_base_health_changed(current_health: float, max_health: float) -> void:
	hud.set_base_health(current_health, max_health)


func _on_player_died() -> void:
	hud.set_status_message("Player eliminated - press R to restart or wait for the base outcome.")
	hud.set_restart_hint_visible(true)


func _on_base_destroyed() -> void:
	if _run_state != RunState.ACTIVE:
		return

	_run_state = RunState.FAILED
	wave_manager.stop_run(true)
	_freeze_player()

	hud.set_status_message("Run failed.")
	hud.set_center_message("BASE DESTROYED")
	hud.set_restart_hint_visible(true)


func _on_run_started(total_waves: int) -> void:
	hud.set_status_message("Prepare for the first wave.")
	hud.set_wave_info(0, total_waves)
	hud.set_enemy_info(0, 0)


func _on_intermission_started(next_wave: int, duration: float) -> void:
	if _run_state != RunState.ACTIVE:
		return

	hud.set_status_message("Intermission - next wave in %.1f seconds." % duration)
	hud.set_enemy_info(0, 0)

	if next_wave > 1:
		_show_temporary_message("WAVE CLEARED", 1.25)


func _on_wave_started(wave: int, total_waves: int, total_enemies: int) -> void:
	if _run_state != RunState.ACTIVE:
		return

	hud.set_status_message("Wave %d started." % wave)
	hud.set_wave_info(wave, total_waves)
	hud.set_enemy_info(0, total_enemies)

	_show_temporary_message("WAVE %d" % wave, 1.25)


func _on_wave_progress_changed(
	wave: int,
	total_waves: int,
	alive_enemies: int,
	remaining_to_spawn: int,
	total_enemies: int
) -> void:
	hud.set_wave_info(wave, total_waves)
	hud.set_enemy_info(alive_enemies, remaining_to_spawn)


func _on_wave_cleared(wave: int, total_waves: int) -> void:
	if _run_state != RunState.ACTIVE:
		return

	hud.set_status_message("Wave %d cleared." % wave)
	hud.set_enemy_info(0, 0)


func _on_run_completed(total_waves: int) -> void:
	if _run_state != RunState.ACTIVE:
		return

	_run_state = RunState.WON
	wave_manager.stop_run(true)
	_freeze_player()

	hud.set_status_message("All waves cleared.")
	hud.set_center_message("RUN COMPLETE")
	hud.set_restart_hint_visible(true)


func _show_temporary_message(text: String, duration: float) -> void:
	_message_token += 1
	var current_token := _message_token

	hud.set_center_message(text)

	var timer := get_tree().create_timer(duration)
	await timer.timeout

	if current_token == _message_token and _run_state == RunState.ACTIVE:
		hud.clear_center_message()
