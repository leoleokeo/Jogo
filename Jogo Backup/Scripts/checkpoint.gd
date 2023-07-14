extends Area2D

func _on_checkpoint_body_entered(body):
	if body.name == "Player":
		$anim.play("on")
		body.hit_checkpoint()
		body.nao_zere_pontos = true
