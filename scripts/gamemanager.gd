# gamemanager script attach to gamemanager node
# gamemanager.gd
extends Node

# Make gameoverscreen var for when needed
@onready var game_over_screen = $GameOverScreen

func _ready():
	# Add this node to game_manager group to be found easily
	add_to_group("game_manager")
	# Initially hide game over screen, connect restart button
	if game_over_screen:
		game_over_screen.hide()
		var restart_button = game_over_screen.get_node("Control/Button")
		if restart_button:
			restart_button.pressed.connect(_on_restart_button_pressed)

# Function called when enemy collides with wall
func game_over():
	print("Game Over! The wall was breached!")
	# Show game over screen
	if game_over_screen:
		game_over_screen.show()
	# Find all enemies and stop them from moving
	var enemies = get_tree().get_nodes_in_group("enemies")
	for enemy in enemies:
		enemy.game_started = false

# Function to restart game
func restart_game():
	print("Restarting game...")
	
	# Find all enemies, reset them
	var enemies = get_tree().get_nodes_in_group("enemies")
	for enemy in enemies:
		if enemy.has_method("reset_to_start"):
			enemy.reset_to_start() 
	
	# Re-hide game over screen
	if game_over_screen:
		game_over_screen.hide()

# Debuging mainly, could likely remove later *********
# Function called when restart button clicked
func _on_restart_button_pressed():
	print("Restart button pressed!")
	restart_game()
