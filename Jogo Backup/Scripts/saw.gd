extends KinematicBody2D

var motion = Vector2()
var speed = 1
var move_dir = -1

func _physics_process(_delta):
	motion.x += move_dir * speed
	if $raycast.is_colliding():
		$raycast.scale.x *= -1
		move_dir *= -1
	#print(motion.x)
	move_and_collide(motion)

func _on_Area2D_body_entered(body):
	body.movement.y = body.jump_force
	body.health -= 1
	body.hurtted = true
