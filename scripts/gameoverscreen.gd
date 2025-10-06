# gameoverscreen.gd —— 挂在 GameOverScreen (CanvasLayer)
extends CanvasLayer

@onready var restart_button: Button = $"Control/Button"

func _ready() -> void:
	restart_button.pressed.connect(_to_start)

func _to_start() -> void:
	get_tree().change_scene_to_file("res://scenes/start_screen.tscn") 
