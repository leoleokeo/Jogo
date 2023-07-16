extends CanvasLayer

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
func _on_Button_pressed():
	get_tree().quit()

func _on_pause_quit_btn_pressed():
	get_tree().quit()

func _on_pause_continue_btn_pressed():
	toggle_pause()
