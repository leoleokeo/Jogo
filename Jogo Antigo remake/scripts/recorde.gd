extends Label

func _ready():
	Global.carregar()
	text = str(Global.record)
