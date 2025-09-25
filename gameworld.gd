extends Node2D

# Movement directions based on wasd keypad
var direction_map = {
	"a": Vector2.LEFT,
	"d": Vector2.RIGHT,
}


func _ready():
	$Background.size = get_viewport().get_visible_rect().size
	$TextEdit.text_changed.connect(_on_text_changed)
	

func _on_text_changed():
	if $TextEdit.text.ends_with("\n"): # get line of input
		var command = $TextEdit.text.strip_edges().to_lower()
		$TextEdit.text = "" # clear textbox input field
		process_command(command) # run command

func process_command(command):
	if command.length() == 0:
		return # nothing entered/currently moving
	
	if command in direction_map:
		$Player.move_in_direction(direction_map[command])
	else:
		# loop through all commands if multiple
		for cmd_char in command:
			if cmd_char in direction_map:
				$Player.move_in_direction(direction_map[cmd_char])
