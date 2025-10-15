# introscreen.gd
# introscreen script attached to the IntroScreen CanvasLayer

extends CanvasLayer

# Make sure button connected and screen hidden intially
func _ready():
	# Connect the next button
	$Control/Button.pressed.connect(_on_next_button_pressed)
	visible = false

# Next button pressed, start gameplay
func _on_next_button_pressed():
	get_tree().call_group("game_manager", "start_gameplay")
	visible = false
