# gamelostscreen.gd
# gamelostscreen script attach to the GameLostScreen CanvasLayer

extends CanvasLayer

# Set up restart button
func _ready() -> void:
	# Connect the restart button
	$Control/Button.pressed.connect(_on_replay_button_pressed)
	$Control/Button2.pressed.connect(_on_exit_button_pressed)

# Calls restart game function for all in group
func _on_exit_button_pressed() -> void:
	get_tree().call_group("game_manager", "exit_game")
	
func _on_replay_button_pressed() -> void:
	get_tree().call_group("game_manager", "replay_game")
