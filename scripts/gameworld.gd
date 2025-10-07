# gameworld.gd
# GameWorld script attach to GameWorld Node

extends Node2D

var direction_map = {
	"a": Vector2.LEFT,
	"d": Vector2.RIGHT,
}

func _ready():
	# $Background.size = get_viewport().get_visible_rect().size
	# Connect textbox input
	$TextEdit.text_changed.connect(_on_text_changed)
	
	# Add enemies to group for GameManager
	$Enemy.add_to_group("enemies")
	$Enemy2.add_to_group("enemies")
	
	# Initially disable TextEdit - will be enabled when game starts
	$TextEdit.editable = false

# Takes input when enter is hit
func _on_text_changed():
	if $TextEdit.text.ends_with("\n"):
		var command = $TextEdit.text.strip_edges().to_lower()
		$TextEdit.text = ""
		process_command(command)

# Processes input command
func process_command(command):
	if command.length() == 0:
		return
	
	if command in direction_map:
		$Player.move_in_direction(direction_map[command])
	else:
		for cmd_char in command:
			if cmd_char in direction_map:
				$Player.move_in_direction(direction_map[cmd_char])
