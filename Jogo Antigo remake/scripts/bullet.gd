extends Area2D

var motion = Vector2.ZERO
var speed = 1300
var speed_acres = 5

func _physics_process(delta):
	Global.speed_bullet -= Global.speed_acres * delta
	motion.x = Global.speed_bullet * delta
	translate(motion)
#	print(Global.speed_bullet)

func _on_bullet_body_entered(body):
#	get_tree().reload_current_scene()
	body.health -= 1
	body.hitted = true
	

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	Global.exit_window = true
#	print("saiu")
#	spawner.exit_window = true
