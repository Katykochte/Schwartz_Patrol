# gameoverscreen.gd
# gameoverscreen script attach to the GameOverScreen CanvasLayer

extends CanvasLayer

@onready var title_label = $Control/Label  # Add this reference

# Set up restart button
func _ready():
	# Connect the restart button
	$Control/Button.pressed.connect(_on_restart_button_pressed)

# Shows screen overlay with game lost message  
func show_game_over():
	title_label.text = "Game Over!\nThe wall was breached!"
	visible = true

# Shows screen overlay with game won message  
func show_game_won():
	title_label.text = "You Win!\nAll enemies defeated!"
	visible = true

# Shows screen overlay
func show_screen():
	visible = true

# Hides screen overlay
func hide_screen():
	visible = false

# Calls restart game function for all in group
func _on_restart_button_pressed():
	get_tree().call_group("game_manager", "restart_game")
