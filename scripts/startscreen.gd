# startscreen.gd 
# StartScreen script attach to the StartScreen CanvasLayer

extends CanvasLayer

func _ready() -> void:
	# Connect the start button
	$Control/Button.pressed.connect(_on_start_button_pressed)
	
	# Make sure start screen is visible initially
	visible = true


# Calls start game function for all in group
func _on_start_button_pressed() -> void:
	# Hide start screen
	visible = false
	
