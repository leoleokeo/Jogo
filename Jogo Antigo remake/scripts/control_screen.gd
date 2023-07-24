extends Control

func _ready():
	$back.grab_focus()

func _on_back_pressed():
	get_tree().change_scene("res://prefabs/start_screen.tscn")
