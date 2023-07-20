extends Label

func _physics_process(delta):
	text = "00" + str(Global.life)
