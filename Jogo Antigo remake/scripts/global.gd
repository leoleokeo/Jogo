extends Node

var exit_window = true
var speed_bullet = -1500
var speed_acres = 1
var life
var record

const file = "res://save_datas/save.txt"

func salvar():
	var save = File.new()
	var erro = save.open(file, File.WRITE)
	
	var dados = {"recorde" : record}
	
	if !erro:
		save.store_var(dados)
	else:
		print("erro ao salvar dados")
		
	save.close()
func carregar():
	var save = File.new()
	var erro = save.open(file, File.READ)
	
	if !erro:
		var dados_salvos = save.get_var()
		record = dados_salvos["recorde"]
	else:
		print("erro ao carregar dados")
	
	save.close()
