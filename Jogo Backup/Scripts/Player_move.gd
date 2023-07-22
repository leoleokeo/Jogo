extends KinematicBody2D

var movement = Vector2.ZERO
export var move_speed = 480
export var gravity = 25
var gravity_max = 400
export var jump_force = 300
var is_grounded
var is_jumping
onready var raycasts = $RayCasts
export var health = 3
var hurtted = false
var nao_zere_pontos = false

func _ready():
	position.x = Global.checkpoint_pos

func _physics_process(_delta):
	if nao_zere_pontos:
		Global.fruits = Global.fruits
	if movement.y < gravity_max:
		movement.y = movement.y + gravity
	set_anim()
	Global.player_health = health
	is_grounded = check_is_grounded()
	is_jumping = jump()
	get_move_dir()
	jump()
	check_health()
	move_and_slide(movement)
	for platforms in get_slide_count():
		var collision = get_slide_collision(platforms)
		if collision.collider.has_method("collide_with"):
			collision.collider.collide_with(collision, self)

func get_move_dir():
	movement.x = 0
	var movement_dir = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	movement.x = lerp(movement.x, movement_dir * move_speed * 3, 0.2)
	if Input.is_action_pressed("move_left"):
		$Sprite.scale.x = -1
	elif Input.is_action_pressed("move_right"):
		$Sprite.scale.x = 1

func jump():
	if Input.is_action_pressed("jump") and is_grounded:
		movement.y = jump_force
		return true
	return false

func check_is_grounded():
	for raycast in raycasts.get_children():
		if raycast.is_colliding():
			return true
	return false
func check_is_falling():
	return 
func set_anim():
	var anim
	
	if is_jumping:
		anim = "jump"
	elif movement.x != 0 and is_grounded:
		anim = "run"
	elif !is_grounded and movement.y > 0:
		anim = "fall"
	elif hurtted:
		anim = "hit"
		hurtted = false
	else:
		anim = "idle"
	
	if $anim.assigned_animation != anim:
		$anim.play(anim)
func check_health():
	if health < 1:
		if Global.checkpoint_pos != 0:
			nao_zere_pontos = true
		if !nao_zere_pontos:
			Global.fruits = 0
			nao_zere_pontos = false
		get_tree().reload_current_scene()
func hit_checkpoint():
	Global.checkpoint_pos = position.x

func _on_hurtbox_body_entered(body):
	health -= 1
	hurtted = true
