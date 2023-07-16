extends Control

var isPaused = false

func _ready():
	hide()
	get_tree().paused = false

func _input(event):
	if event.is_action_pressed("pause"):
		toggle_pause()

func toggle_pause():
	isPaused = !isPaused
	if isPaused:
		show()
		get_tree().paused = true
	else:
		hide()
		get_tree().paused = false
