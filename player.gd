# player.gd (attach to the Player node)
extends CharacterBody2D

var grid_size = 64
var is_moving = false

func move_in_direction(direction):
	if is_moving:
		return false
	
	is_moving = true
	var target_position = position + (direction * grid_size)
	position = target_position  #moves character
	is_moving = false
	return true
