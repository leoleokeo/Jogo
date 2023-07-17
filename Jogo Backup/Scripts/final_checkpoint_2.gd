extends Area2D

var next_fase = 1

func _on_final_check_body_entered(body):
	if body.name == "Player":
		$AnimationPlayer.play("entered")
		next_fase += 1
func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "entered":
		get_tree().change_scene("res://Cenas/Fase 3.tscn")
		Global.checkpoint_pos = 0
