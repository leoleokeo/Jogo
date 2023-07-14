extends Area2D

func _on_fall_zone_body_entered(body):
	#print(body)
	if !body.nao_zere_pontos:
		Global.fruits = 0
	get_tree().reload_current_scene()
