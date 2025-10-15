# gamemanager.gd
# GameManager script attach to GameManager node

extends Node

# Make vars for screens when needed
@onready var game_over_screen = get_parent().get_node("GameOverScreen")
@onready var start_screen = get_parent().get_node("StartScreen")
@onready var intro_screen = get_parent().get_node("IntroScreen")
@onready var player = get_parent().get_node("Player")


func _ready():
	# Add this node to game_manager group to be found easily
	add_to_group("game_manager")
	
	# Initially hide game over screen
	if game_over_screen:
		game_over_screen.visible = false
	
	# Connect start screen button
	if start_screen:
		var start_button = start_screen.get_node("Control/Button")
		if start_button:
			start_button.pressed.connect(_on_start_button_pressed)
			
		# Show start screen initially
		start_screen.visible = true
	
	# Initially stop all gameplay
	call_deferred("stop_gameplay")
	
# Function to check if all enemies are defeated
func check_game_won() -> bool:
	var enemies = get_tree().get_nodes_in_group("enemies")
	for enemy in enemies:
		# Check if enemy is both valid and visible (not shot)
		if is_instance_valid(enemy) and enemy.visible:
			return false
	# All enemies are either invalid or not visible, so game won
	return true

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
		
	# Hide quiz screen if visible
	if game_world.has_node("QuizScreen"):
		game_world.get_node("QuizScreen").visible = false

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
	# Hide start screen and show next screen
	start_screen.visible = false
	intro_screen.visible = true

# Function called when enemy collides with wall
func game_over():
	print("Game Over! The wall was breached!")
	
	# Show game over screen
	if game_over_screen:
		game_over_screen.show_game_over()
		
	# Stop all gameplay
	stop_gameplay()

# Function called when a game is won
func game_won():
	print("Game Won! All enemies defeated!")
	
	# Show game won screen
	if game_over_screen:
		game_over_screen.show_game_won()
		
	# Stop all gameplay
	stop_gameplay()
	
func check_game_won_condition():
	if check_game_won():
		game_won()

# Function to restart game
func restart_game():
	print("Restarting game - returning to start screen...")
	
	# Find all enemies, reset them
	var enemies = get_tree().get_nodes_in_group("enemies")
	for enemy in enemies:
		enemy.reset_to_start() 
		
	# WRITE CODE TO RESET PLAYER TOO
	
	# Hide game over screen
	if game_over_screen:
		game_over_screen.visible = false
	
	# Show start screen
	if start_screen:
		start_screen.visible = true
	
	# Stop gameplay until start is pressed again
	stop_gameplay()


func replay_game():
	print("Replaying game - resetting characters")
	
	# Find all enemies, reset them
	var enemies = get_tree().get_nodes_in_group("enemies")
	for enemy in enemies:
		enemy.reset_to_start() 
		
	# WRITE CODE TO RESET PLAYER TOO
	
	# Hide game over screen
	if game_over_screen:
		game_over_screen.visible = false
	
	# Stop gameplay until start is pressed again
	start_gameplay()
