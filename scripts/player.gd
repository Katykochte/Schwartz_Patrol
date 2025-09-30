# player.gd (attach to the Player node)
extends CharacterBody2D

var grid_size = 64
var is_moving = false

func _ready():
	# Player doesn't need collision, turn off to be safe
	if has_node("CollisionShape2D"):
		$CollisionShape2D.disabled = true

func move_in_direction(direction):
	if is_moving:
		return false
	
	is_moving = true
	var target_position = position + (direction * grid_size)
	position = target_position  # Moves character
	is_moving = false
	return true
