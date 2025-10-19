# helpscreen.gd
# helpscreen script attached to the HelpScreen CanvasLayer

extends CanvasLayer

@onready var help_label = $Panel/Label
@onready var close_help_button = $Panel/Button/Label
@onready var help_button = get_parent().get_node("Button")

func _on_button_pressed() -> void:
	
	if !visible:
		help_button.visible = false
		get_tree().call_group("game_manager", "stop_gameplay")
		visible = true
		get_tree().call_group("game_manager", "pause_game")
		close_help_button.text = "Close Help"
		
	else:
		visible = false
		help_button.visible = true
		get_tree().call_group("game_manager", "start_gameplay")
		
