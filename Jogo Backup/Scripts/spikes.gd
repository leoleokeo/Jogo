extends Area2D

func _physics_process(delta):
	pass

func _on_spikes_body_entered(body):
	body.movement.y = body.jump_force
	body.health -= 1
	body.hurtted = true
