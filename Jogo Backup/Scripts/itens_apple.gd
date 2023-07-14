extends Area2D

export var apple_valor = 1

func _on_item_body_entered(_body):
	Global.fruits += apple_valor
	$anim.play("collected")
	pass


func _on_anim_animation_finished(anim_name):
	if anim_name == "collected":
		queue_free()
	pass
