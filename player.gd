extends CharacterBody2D

# Movement settings
var grid_size = 64
var is_moving = false

func move_in_direction(direction):
	if is_moving:
		return false  # Can't move right now
	
	is_moving = true
	var target_position = position + (direction * grid_size)
	position = target_position
	is_moving = false
	return true  # Move successful
