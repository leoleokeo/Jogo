extends KinematicBody2D

var velocidade = 1000
var health = 5
var hitted = false 
var anim
var flying = true
var move_on = true

func _physics_process(delta):
	var direcao = Vector2.ZERO
	if Input.is_action_pressed("move_right") and move_on:
		direcao.x += 1
	if Input.is_action_pressed("move_left") and move_on:
		direcao.x -= 1
	if Input.is_action_pressed("move_down") and move_on:
		direcao.y += 1
	if Input.is_action_pressed("move_up") and move_on:
		direcao.y -= 1
	check_animation()
	if health == 0:
		move_on = false
		yield(get_tree().create_timer(0.5), "timeout")
		Global.speed_bullet = -1500
		get_tree().reload_current_scene()
		
#	print(health)
	Global.life = health
	var movimento = direcao * delta * velocidade * 50
	move_and_slide(movimento)
	
func check_animation():
	if flying:
		anim = "fly"
		flying = false
	elif hitted:
		anim = "hitted"
		hitted = false
	$anim.play(anim)
func _on_anim_animation_finished(anim_name):
	if anim_name == "hitted":
		flying = true
