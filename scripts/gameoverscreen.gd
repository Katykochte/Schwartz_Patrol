# gameoverscreen.gd
# gameoverscreen script attach to the GameOverScreen CanvasLayer

extends CanvasLayer

@onready var title_label = $Control/Label 

# Set up restart button
func _ready() -> void:
	# Connect the restart button
	$Control/Button.pressed.connect(_on_restart_button_pressed)
	$Control/Button2.pressed.connect(_on_replay_button_pressed)

# Shows screen overlay with game lost message  
func show_game_over() -> void:
	visible = true

# Shows screen overlay with game won message  
func show_game_won() -> void:
	title_label.text = "You Win!\nAll enemies defeated!"
	visible = true

# Calls restart game function for all in group
func _on_restart_button_pressed() -> void:
	get_tree().call_group("game_manager", "restart_game")
	
func _on_replay_button_pressed() -> void:
	get_tree().call_group("game_manager", "replay_game")
