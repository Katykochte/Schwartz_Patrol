# introscreen.gd
# introscreen script attached to the IntroScreen CanvasLayer

extends CanvasLayer

# Make sure button connected and screen hidden intially
func _ready():
	# Connect the next button
	$Control/Button.pressed.connect(_on_next_button_pressed)
	hide_screen()

# Next button pressed, start gameplay
func _on_next_button_pressed():
	get_tree().call_group("game_manager", "start_gameplay")
	hide_screen()

# Shows screen overlay
func show_screen():
	visible = true
	
# Hides screen overlay
func hide_screen():
	visible = false
