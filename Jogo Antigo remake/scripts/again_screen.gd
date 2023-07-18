extends CanvasLayer

func _ready():
	$buttons/again_btn.grab_focus()

func _physics_process(delta):
	if Global.is_dead:
		Global.is_dead = false
		Global.is_showing = true
		show()
		get_tree().paused = true
		if Global.record == Global.pontuacao:
			$Control/label.text = "Melhor pontuação:"
		else:
			$Control/label.text = "Pontuação Final:"
		$Control/score.text = str(Global.pontuacao)
	if !Global.is_showing:
		hide()
		get_tree().paused = false
		
func _on_again_btn_pressed():
	get_tree().reload_current_scene()
	Global.is_showing = false

func _on_quit_btn_pressed():
	get_tree().quit()

func _on_quit_title_btn_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://prefabs/start_screen.tscn")
	Global.is_showing = false
