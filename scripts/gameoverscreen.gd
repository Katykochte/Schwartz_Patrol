# gameoverscreen.gd (attach to the GameOverScreen CanvasLayer)
extends CanvasLayer

func _ready():
	# Connect the restart button
	$Control/Button.pressed.connect(_on_restart_button_pressed)

func show_screen():
	visible = true

func hide_screen():
	visible = false

# Calls restart game function for all in group
func _on_restart_button_pressed():
	get_tree().call_group("game_manager", "restart_game")
