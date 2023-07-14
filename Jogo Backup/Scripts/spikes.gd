extends Area2D

func _physics_process(delta):
	pass

func _on_spikes_body_entered(body):
	body.movement.y -= 800
	body.health -= 1
	body.hurtted = true
