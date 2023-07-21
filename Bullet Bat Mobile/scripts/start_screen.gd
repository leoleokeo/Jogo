extends Control

func _ready():
	Global.carregar()

func _on_startBTN_pressed():
	Global.salvar()
	get_tree().change_scene("res://scenes/main.tscn")

func _on_quitBTN_pressed():
	Global.salvar()
	get_tree().quit()
