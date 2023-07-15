extends Control

func _on_startBTN_pressed():
	get_tree().change_scene("res://scenes/main.tscn")

func _on_quitBTN_pressed():
	get_tree().quit()

func _on_controlsBTN_pressed():
	get_tree().change_scene("res://prefabs/control_screen.tscn")
