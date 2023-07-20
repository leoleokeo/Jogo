extends CanvasLayer

var show = false

func _ready():
	hide()
	get_tree().paused = false

func _input(event):
	if event.is_action_pressed("pause"):
		toggle_pause()
func toggle_pause():
	show = !show
	
	if show:
		Global.is_paused = true
		get_tree().paused = true
		show()
		Global.salvar()
	elif !show:
		Global.is_paused = false
		get_tree().paused = false
		hide()


func _on_pause_quit_btn_pressed():
	get_tree().quit()
	Global.salvar()
func _on_back_menu_pause_btn_pressed():
	toggle_pause()
	get_tree().change_scene("res://prefabs/start_screen.tscn")
func _on_continuar_pause_btn_pressed():
	toggle_pause()
