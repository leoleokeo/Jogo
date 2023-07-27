extends Position2D

var spawner_pos = self

onready var spawn_reference = preload("res://prefabs/bullet.tscn")

var timeout = false
var spawn_interval = 2.0
var increase_rate = 0.1  # Taxa de aumento do intervalo de spawn
var max_spawn_interval = 5.0  # Intervalo máximo de spawn permitido

export (NodePath) var spawner_path
onready var spawner = get_node(spawner_path)

func _ready():
	set_physics_process(false)
	yield(get_tree().create_timer(2.0), "timeout")
	set_physics_process(true)

func _physics_process(delta):
	if Global.exit_window:
		randomize()
		spawner.position.y = rand_range(5, 595)
		spawn()
		Global.exit_window = false
#	print(spawner_pos.position.y)

func spawn():
	var spawn_instance = spawn_reference.instance()
	get_parent().add_child(spawn_instance)
	spawn_instance.global_translate(global_position)

	# Aumentar a frequência gradualmente
	spawn_interval += increase_rate
	if spawn_interval < max_spawn_interval:
		spawn_interval = max_spawn_interval
	print(spawn_interval)
