# enemy script attach to enemy scene
extends CharacterBody2D

var grid_size = 64
var game_started = true
var original_position = Vector2.ZERO

func _ready():
	# Set up collision to only detect walls
	collision_layer = 2
	collision_mask = 1
	
	# Save the starting position IMMEDIATELY before anything else
	original_position = position
	print(name, " original position saved: ", original_position)

func _on_timer_timeout() -> void:
	if not game_started:
		return
		
	var target_position = position + (Vector2.DOWN * grid_size)
	var current_position = position
	
	position = target_position
	
	if check_collision_with_wall():
		position = current_position
		print("Enemy reached the wall! Game Over!")
		# Calls the gameover funct in gamemanager.gd
		get_tree().call_group("game_manager", "game_over")
	else:
		print("Enemy moved to: ", position)

func check_collision_with_wall() -> bool:
	# Get current physics space of map
	var space_state = get_world_2d().direct_space_state
	# Make query about certain shape (enemy collison shape) 
	var query = PhysicsShapeQueryParameters2D.new()
	
	# Make sure node has collison shape
	if has_node("CollisionShape2D"):
		query.shape = $CollisionShape2D.shape
		# Set up to check for collisions with layer 1 (wall) 
		query.transform = $CollisionShape2D.global_transform
		query.collision_mask = 1
		# Actual query of collisons 
		var collisions = space_state.intersect_shape(query)
		# Collison occured, return true
		return collisions.size() > 0
	
	# N collison occured, return false
	return false

func reset_to_start():
	# Move enemy to original position
	position = original_position
	# Restart game
	game_started = true
	# Debig prints
	print(name, " reset to original: ", original_position)
