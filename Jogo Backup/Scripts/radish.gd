extends KinematicBody2D

export var speed = 64
export var health = 3
export var gravity = 800
var motion = Vector2.ZERO
var move_dir = -1
var hitted = false

func _physics_process(delta):
	on_wall_collide()
	set_anim()
	
	motion.y += gravity * delta
	
	motion.x = speed * move_dir
	motion = move_and_slide(motion)
	
	if move_dir == 1:
		$texture.flip_h = true
	else:
		$texture.flip_h = false
		
	if health == 0:
		yield(get_tree().create_timer(0.5), "timeout")
		queue_free()

func on_wall_collide():
	if $raywall.is_colliding():
		return true
	else:
		return false
		
	if health == 0:
		queue_free()

func _on_anim_animation_finished(anim_name):
	if anim_name == "idle":
		$raywall.scale.x *= -1
		move_dir *= -1

func set_anim():
	var anim = "run"
	
	if on_wall_collide():
		anim = "idle"
	if hitted:
		anim = "hit"
		hitted = false
		
	$anim.play(anim)

func _on_hitbox_body_entered(body):
	health -= 1
	hitted = true
	body.movement.y = body.jump_force
