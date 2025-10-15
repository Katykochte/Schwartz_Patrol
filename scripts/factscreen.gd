# factscreen.gd
# factscreen script attached to the FactScreen CanvasLayer

extends CanvasLayer

# Make sure button connected and screen hidden intially
func _ready() -> void:
	# Connect the next button
	$Control/Button.pressed.connect(_on_next_button_pressed)
	visible = false

# Next button pressed, start gameplay
func _on_next_button_pressed() -> void:
	get_tree().call_group("game_manager", "start_gameplay")
	visible = false
