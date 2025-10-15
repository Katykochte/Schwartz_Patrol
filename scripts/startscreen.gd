# startscreen.gd 
# StartScreen script attach to the StartScreen CanvasLayer

extends CanvasLayer

func _ready():
	# Connect the start button
	$Control/Button.pressed.connect(_on_start_button_pressed)
	
	# Make sure start screen is visible initially
	show_screen()

# Shows screen overlay
func show_screen():
	visible = true
	
# Hides screen overlay
func hide_screen():
	visible = false

# Calls start game function for all in group
func _on_start_button_pressed():
	# Hide start screen
	hide_screen()
	
	# get_tree().call_group("game_manager", "start_game")
