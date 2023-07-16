extends Label

var pontos = 0
var speed_acres = 1

func _ready():
	pass

func _physics_process(_delta):
#	speed_acres = speed_acres
	pontos += speed_acres
	
	text = "0000" + str(pontos)
	
	if pontos >= 10:
		text = "000" + str(pontos)
	if pontos >= 100:
		text = "00" + str(pontos)
	if pontos >= 1000:
		text = "0" + str(pontos)
	if pontos >= 10000:
		text = str(pontos)
#	print(pontos)
	record()

func record():
	Global.record = pontos
