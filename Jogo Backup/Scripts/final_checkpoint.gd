extends Area2D

func _on_final_check_body_entered(body):
	if body.name == "Player":
		$AnimationPlayer.play("entered")
func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "entered":
		get_tree().change_scene("res://Cenas/Fase 2.tscn")
		Global.checkpoint_pos = 0
