# helpscreen.gd
# helpscreen script attached to the HelpScreen CanvasLayer

extends CanvasLayer

@onready var help_label = $Panel/Label
@onready var close_help_button = $Panel/Button/Label

func _on_button_pressed() -> void:
	
	if !visible:
		get_tree().call_group("game_manager", "stop_gameplay")
		visible = true
		get_tree().call_group("game_manager", "pause_game")
		help_label.text = "                                   <<Schwartz Patrol Help>>
		
						Movement: Use A and D to move left and right.
						Weapons: Use S to trigger a quiz question.
						You must answer correctly to shoot at enemies.
						Destroy all enemies before they reach the wall to win."
		
		close_help_button.text = "Close Help"
		
	else:
		visible = false
		get_tree().call_group("game_manager", "start_gameplay")
		
