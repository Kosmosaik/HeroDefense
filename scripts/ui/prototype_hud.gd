extends CanvasLayer
class_name PrototypeHUD

@onready var player_health_bar: ProgressBar = $TopLeft/MarginContainer/VBoxContainer/PlayerHealthBar
@onready var player_health_label: Label = $TopLeft/MarginContainer/VBoxContainer/PlayerHealthLabel
@onready var base_health_bar: ProgressBar = $TopLeft/MarginContainer/VBoxContainer/BaseHealthBar
@onready var base_health_label: Label = $TopLeft/MarginContainer/VBoxContainer/BaseHealthLabel
@onready var wave_label: Label = $TopLeft/MarginContainer/VBoxContainer/WaveLabel
@onready var enemies_label: Label = $TopLeft/MarginContainer/VBoxContainer/EnemiesLabel
@onready var status_label: Label = $TopLeft/MarginContainer/VBoxContainer/StatusLabel
@onready var center_message_label: Label = $CenterMessage/MessageLabel
@onready var restart_label: Label = $BottomCenter/RestartLabel


func _ready() -> void:
	clear_center_message()
	set_status_message("")
	set_restart_hint_visible(false)


func set_player_health(current_health: float, max_health: float) -> void:
	player_health_bar.max_value = max_health
	player_health_bar.value = current_health
	player_health_label.text = "Player HP: %d / %d" % [roundi(current_health), roundi(max_health)]


func set_base_health(current_health: float, max_health: float) -> void:
	base_health_bar.max_value = max_health
	base_health_bar.value = current_health
	base_health_label.text = "Base HP: %d / %d" % [roundi(current_health), roundi(max_health)]


func set_wave_info(current_wave: int, total_waves: int) -> void:
	wave_label.text = "Wave: %d / %d" % [current_wave, total_waves]


func set_enemy_info(alive_enemies: int, remaining_to_spawn: int) -> void:
	enemies_label.text = "Enemies: %d alive | %d left to spawn" % [alive_enemies, remaining_to_spawn]


func set_status_message(text: String) -> void:
	status_label.text = text


func set_center_message(text: String) -> void:
	center_message_label.text = text
	center_message_label.visible = text != ""


func clear_center_message() -> void:
	set_center_message("")


func set_restart_hint_visible(visible_state: bool) -> void:
	restart_label.visible = visible_state
