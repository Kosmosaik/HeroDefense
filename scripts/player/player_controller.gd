extends CharacterBody3D

@export_category("Movement")
@export var walk_speed: float = 6.0
@export var sprint_speed: float = 9.0
@export var acceleration: float = 20.0
@export var air_acceleration: float = 8.0
@export var jump_velocity: float = 4.8
@export var gravity_scale: float = 1.0

@export_category("Look")
@export_range(0.001, 0.02, 0.001) var mouse_sensitivity: float = 0.003
@export_range(-89.0, -10.0, 1.0) var min_pitch_degrees: float = -89.0
@export_range(10.0, 89.0, 1.0) var max_pitch_degrees: float = 89.0

@onready var camera_pivot: Node3D = $CameraPivot
@onready var camera: Camera3D = $CameraPivot/Camera3D

var _gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
var _pitch_radians: float = 0.0


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		_toggle_mouse_capture()
		return

	if Input.get_mouse_mode() != Input.MOUSE_MODE_CAPTURED:
		return

	if event is InputEventMouseMotion:
		_rotate_view(event.relative)


func _physics_process(delta: float) -> void:
	_apply_gravity(delta)
	_handle_jump()
	_handle_movement(delta)
	move_and_slide()


func _rotate_view(mouse_delta: Vector2) -> void:
	# Yaw rotates the whole body.
	rotate_y(-mouse_delta.x * mouse_sensitivity)

	# Pitch rotates only the camera pivot.
	_pitch_radians -= mouse_delta.y * mouse_sensitivity
	_pitch_radians = clamp(
		_pitch_radians,
		deg_to_rad(min_pitch_degrees),
		deg_to_rad(max_pitch_degrees)
	)
	camera_pivot.rotation.x = _pitch_radians


func _apply_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= _gravity * gravity_scale * delta


func _handle_jump() -> void:
	if Input.get_mouse_mode() != Input.MOUSE_MODE_CAPTURED:
		return

	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_velocity


func _handle_movement(delta: float) -> void:
	if Input.get_mouse_mode() != Input.MOUSE_MODE_CAPTURED:
		# Stop horizontal movement cleanly when the mouse is released.
		velocity.x = move_toward(velocity.x, 0.0, acceleration * delta)
		velocity.z = move_toward(velocity.z, 0.0, acceleration * delta)
		return

	var input_vector := Input.get_vector(
		"move_left",
		"move_right",
		"move_forward",
		"move_backward"
	)

	var move_basis := global_transform.basis
	var move_direction := (move_basis * Vector3(input_vector.x, 0.0, input_vector.y)).normalized()

	var target_speed := walk_speed
	if Input.is_action_pressed("sprint") and input_vector.length() > 0.0:
		target_speed = sprint_speed

	var target_velocity := move_direction * target_speed
	var current_acceleration := acceleration if is_on_floor() else air_acceleration

	velocity.x = move_toward(velocity.x, target_velocity.x, current_acceleration * delta)
	velocity.z = move_toward(velocity.z, target_velocity.z, current_acceleration * delta)


func _toggle_mouse_capture() -> void:
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
