extends Area2D

export var valor = 1

func _on_item_body_entered(_body):
	Global.fruits += valor
	$anim.play("collected")

func _on_anim_animation_finished(anim_name):
	if anim_name == "collected":
		queue_free()
