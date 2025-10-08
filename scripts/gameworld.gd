# gameworld.gd
# GameWorld script attach to GameWorld Node

extends Node2D

var grid_size = 64

var direction_map = {
	"a": Vector2.LEFT,
	"d": Vector2.RIGHT,
}

# Quiz questions
var quiz_questions = [
	{
		"question": "How do you change directories?",
		"answers": ["ls", "cd", "pwd"],
		"correct_index": 1
	},
	{
		"question": "How do you see folder contents",
		"answers": ["cd", "pwd", "ls"],
		"correct_index": 2
	},
	{
		"question": "How do you see you current path?",
		"answers": ["pwd", "ls", "cd"],
		"correct_index": 0
	}
	# Add more questions later !!!!!!?????
]

func _ready():
	# Connect textbox input
	$TextEdit.text_changed.connect(_on_text_changed)
	# Connect quiz screen
	$QuizScreen.quiz_completed.connect(_on_quiz_completed)
	
	# Add enemies to group for GameManager
	$Enemy.add_to_group("enemies")
	$Enemy3.add_to_group("enemies")
	
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
	
	# Check for shoot command
	if command == "s":
		try_shoot_arrow()
		return
	
	if command in direction_map:
		$Player.move_in_direction(direction_map[command])
	else:
		for cmd_char in command:
			if cmd_char in direction_map:
				$Player.move_in_direction(direction_map[cmd_char])

# Arrow shooting function
func try_shoot_arrow():
	# Don't allow shooting if quiz is already active
	if $QuizScreen.visible:
		print("Quiz already active!")
		return false
	
	var player_pos = $Player.position
	var enemies = get_tree().get_nodes_in_group("enemies")
	
	# Calculate which "column" the player is in
	var player_column = round(player_pos.x / grid_size)
	
	# Check if any enemy is in the same column
	for enemy in enemies:
		var enemy_column = round(enemy.position.x / grid_size)
		if enemy_column == player_column:
			var random_question = quiz_questions[randi() % quiz_questions.size()]
			$QuizScreen.show_question(random_question, enemy)
			print("Enemy targeted - quiz starting!")
			return true
	
	print("No enemy in sight to shoot!")
	return false
	
func _on_quiz_completed(correct: bool):
	if correct and $QuizScreen.target_enemy and is_instance_valid($QuizScreen.target_enemy):
		# Hide "shot" enemy and stop it's movement
		var enemy = $QuizScreen.target_enemy
		enemy.visible = false
		enemy.game_started = false
		print("Correct! Enemy gone!")
		  
		# Check if all enemies are defeated
		get_tree().call_group("game_manager", "check_game_won_condition")
	else:
		print("Wrong answer - enemy continues moving")
		
# Function to check if game won
func check_game_won_condition():
	get_tree().call_group("game_manager", "check_game_won_condition")
