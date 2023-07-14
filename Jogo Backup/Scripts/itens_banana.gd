extends Area2D

export var banana_valor = 3

func _on_item_body_entered(_body):
	Global.fruits += banana_valor
	$anim.play("collected")
	pass


func _on_anim_animation_finished(anim_name):
	if anim_name == "collected":
		queue_free()
	pass
