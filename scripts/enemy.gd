# enemy.gd
# Enemy script attach to Enemy scene

extends CharacterBody2D

@export var grid_size: int = 64
@export var step_duration: float = 0.35   
var game_started := true
var is_moving := false
var original_position := Vector2.ZERO

func _ready() -> void:
	collision_layer = 2
	collision_mask = 1
	original_position = global_position

func snap_to_grid() -> void:
	# Snap position to the grid
	var snapped_x = round(global_position.x / grid_size) * grid_size
	var snapped_y = round(global_position.y / grid_size) * grid_size
	global_position = Vector2(snapped_x, snapped_y)

func _on_timer_timeout() -> void:
	if not game_started or is_moving:
		return

	var motion := Vector2.DOWN * grid_size

	if test_move(global_transform, motion):
		print("Enemy reached the wall! Game Over!")
		get_tree().call_group("game_manager", "game_over")
		return

	is_moving = true
	var tween := get_tree().create_tween()
	tween.tween_property(self, "global_position", global_position + motion, step_duration) \
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

	tween.finished.connect(func ():
		is_moving = false
		print("Enemy moved to: ", global_position)
	)

func reset_to_start() -> void:
	is_moving = false
	global_position = original_position
	snap_to_grid()
	visible = true
	game_started = true
	print(name, " reset to original: ", original_position)
