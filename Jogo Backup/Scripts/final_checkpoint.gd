extends Area2D

func _on_final_check_body_entered(body):
	if body.name == "Player":
		$AnimationPlayer.play("entered")
