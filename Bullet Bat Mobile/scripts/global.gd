extends Node

var exit_window = true
var speed_bullet = -1500
var speed_acres = 1
var life
var pontuacao = 0
var record = 0
var is_dead = false
var is_showing = false
var is_paused = false

const file = "user://save.json"

func _ready():
	carregar()

func salvar():
	var save = File.new()
	var erro = save.open(file, File.WRITE)
	
	var dados = {"recorde" : record}
	
	if !erro:
		var json_str = JSON.print(dados)
		save.store_var(dados)
	else:
		print("erro ao salvar dados")
		
	save.close()
func carregar():
	var save = File.new()
	var erro = save.open(file, File.READ)
	if save.file_exists(file):
		if !erro:
			var json_str = save.get_as_text()
			var dados_salvos = JSON.parse(json_str)
			if "recorde" in dados_salvos:
				record = dados_salvos["recorde"]
		else:
			print("erro ao carregar dados")
		save.close()
	else:
		print("arquivo de salvamento nao encontrado")
		
	
func _physics_process(delta):
#	print(pontuacao)
	pass
