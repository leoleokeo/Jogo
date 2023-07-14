extends Area2D

func _on_lago_body_entered(body):
	if !body.nao_zere_pontos:
		Global.fruits = 0
	get_tree().reload_current_scene()
