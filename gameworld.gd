extends Node2D

# Movement directions based on wasd keypad
var direction_map = {
	"a": Vector2.LEFT,
	"d": Vector2.RIGHT,
}

# Grid cell size (pixels per movement)
var grid_size = 64  # Move exactly 64 pixels each time
var is_moving = false

func _ready():
	# $Background.size = get_viewport().size
	$TextEdit.text_changed.connect(_on_text_changed)
	

func _on_text_changed():
	if $TextEdit.text.ends_with("\n"): # get line of input
		var command = $TextEdit.text.strip_edges().to_lower()
		$TextEdit.text = "" # clear textbox input field
		process_command(command) # run command

func process_command(command):
	if command.length() == 0 or is_moving:
		return # nothing entered/currently moving
	
	if command in direction_map:
		move_player_to_grid_pos(direction_map[command])
	else:
		# loop through all commands if multiple
		for cmd_char in command:
			if cmd_char in direction_map:
				move_player_to_grid_pos(direction_map[cmd_char])

func move_player_to_grid_pos(direction):
	is_moving = true
	
	# Calculate target position
	var target_position = $Player.position + (direction * grid_size)
	
	# Move player to new position
	$Player.position = target_position
	
	# Reset moving flag
	is_moving = false
