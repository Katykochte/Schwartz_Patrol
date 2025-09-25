# enemy.gd (attach to the Enemy node)
extends CharacterBody2D

var grid_size = 64
var is_moving = false

var count = 0
var direction = Vector2.DOWN

func _on_timer_timeout() -> void:
	if count < 7:
		var target_position = position + (direction * grid_size)
		position = target_position  # moves character
		count += 1
	else: 
		count = 0
		if direction == Vector2.DOWN:
			direction = Vector2.UP
		else: 
			direction = Vector2.DOWN
		var target_position = position + (direction * grid_size)
		position = target_position  # moves character
		count += 1
