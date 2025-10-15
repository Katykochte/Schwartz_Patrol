extends CharacterBody2D

@export var grid_size: int = 64
var is_moving = false
var original_position := Vector2.ZERO

# Function to save position
func _ready() -> void:
	original_position = global_position
	# Snap to grid on start
	snap_to_grid()

func reset_to_start() -> void:
	global_position = original_position
	snap_to_grid()
	
func snap_to_grid() -> void:
	# Snap position to the grid
	var snapped_x = round(global_position.x / grid_size) * grid_size
	var snapped_y = round(global_position.y / grid_size) * grid_size
	global_position = Vector2(snapped_x, snapped_y)

func move_in_direction(direction: Vector2) -> bool:
	if is_moving:
		return false

	is_moving = true
	var target_position = position + direction * grid_size

	var viewport_size = get_viewport().get_visible_rect().size
	var half_width = 32.0  # Consistent value

	target_position.x = clamp(target_position.x, half_width, viewport_size.x - half_width)
	target_position.y = position.y

	position = target_position
	is_moving = false
	return true
