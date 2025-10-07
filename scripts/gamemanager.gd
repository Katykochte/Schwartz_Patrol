# gamemanager.gd
# GameManager script attach to GameManager node

extends Node

# Make vars for screens when needed
@onready var game_over_screen = get_parent().get_node("GameOverScreen")
@onready var start_screen = get_parent().get_node("StartScreen")


func _ready():
	# Add this node to game_manager group to be found easily
	add_to_group("game_manager")
	
	# Initially hide game over screen, connect restart button
	if game_over_screen:
		game_over_screen.hide_screen()
		var restart_button = game_over_screen.get_node("Control/Button")
		if restart_button:
			restart_button.pressed.connect(_on_restart_button_pressed)
	
	# Connect start screen button
	if start_screen:
		var start_button = start_screen.get_node("Control/Button")
		if start_button:
			start_button.pressed.connect(_on_start_button_pressed)
			
		# Show start screen initially
		start_screen.show_screen()
	
	# Initially stop all gameplay
	call_deferred("stop_gameplay")
	
# Function to stop all gameplay elements
func stop_gameplay():
	# Stop enemies
	var enemies = get_tree().get_nodes_in_group("enemies")
	for enemy in enemies:
		enemy.game_started = false
		
	# Disable text input
	var game_world = get_parent()
	if game_world.has_node("TextEdit"):
		game_world.get_node("TextEdit").editable = false

# Function to start gameplay
func start_gameplay():
	# Start enemies
	var enemies = get_tree().get_nodes_in_group("enemies")
	for enemy in enemies:
		enemy.game_started = true
	
	# Enable text input
	var game_world = get_parent()
	if game_world.has_node("TextEdit"):
		game_world.get_node("TextEdit").editable = true
		game_world.get_node("TextEdit").grab_focus()

# Function called when start button is pressed
func _on_start_button_pressed():
	print("Start button pressed!")
	start_game()

# Function to start the game (from start screen)
func start_game():
	print("Starting game...")
	
	# Hide start screen
	if start_screen:
		start_screen.hide_screen()
	
	# Start gameplay elements
	start_gameplay()

# Function called when enemy collides with wall
func game_over():
	print("Game Over! The wall was breached!")
	
	# Show game over screen
	if game_over_screen:
		game_over_screen.show_screen()
		
	# Stop all gameplay
	stop_gameplay()

# Function to restart game
func restart_game():
	print("Restarting game - returning to start screen...")
	
	# Find all enemies, reset them
	var enemies = get_tree().get_nodes_in_group("enemies")
	for enemy in enemies:
		if enemy.has_method("reset_to_start"):
			enemy.reset_to_start() 
	
	# Hide game over screen
	if game_over_screen:
		game_over_screen.hide_screen()
	
	# Show start screen
	if start_screen:
		start_screen.show_screen()
	
	# Stop gameplay until start is pressed again
	stop_gameplay()

# Function called when restart button clicked
func _on_restart_button_pressed():
	print("Restart button pressed!")
	restart_game()
