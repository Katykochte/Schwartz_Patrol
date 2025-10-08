# quizscreen.gd
# QuizScreen script attach to QuizScreen CanvasLayer

extends CanvasLayer

signal quiz_completed(correct_answer: bool)

var current_question: Dictionary
var target_enemy: Node2D

func _ready():
	hide_screen()

func show_question(question_data: Dictionary, enemy: Node2D):
	target_enemy = enemy
	current_question = question_data
	
	# Update question text
	$Panel/Label.text = question_data["question"]
	
	# Set up answer buttons
	var answers = question_data["answers"]
	var buttons = [
		$Panel/Button,
		$Panel/Button2, 
		$Panel/Button3
	]
	
	for i in range(answers.size()):
		if i < buttons.size():
			var button = buttons[i]
			button.text = answers[i]
			# Disconnect any previous connections to avoid bugs
			if button.is_connected("pressed", _on_answer_selected):
				button.pressed.disconnect(_on_answer_selected)
			button.pressed.connect(_on_answer_selected.bind(i))
	
	show_screen()

func _on_answer_selected(answer_index: int):
	# Check if pressed button matches answer
	var correct = (answer_index == current_question["correct_index"])
	emit_signal("quiz_completed", correct)
	hide_screen()

func show_screen():
	visible = true

func hide_screen():
	visible = false
