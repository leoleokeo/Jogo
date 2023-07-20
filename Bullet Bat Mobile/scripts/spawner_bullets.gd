extends Position2D

onready var spawner_pos = self

onready var spawn_reference = preload("res://prefabs/bullet.tscn")

var timeout = false

export (NodePath) var spawner_path
onready var spawner = get_node(spawner_path)

func _physics_process(delta):
	yield(get_tree().create_timer(2.0), "timeout")
	var y_variant = rand_range(5, 595)
	if Global.exit_window:
		randomize()
		spawner_pos.position.y = y_variant
		spawn()
		Global.exit_window = false
#	print(spawner_pos.position.y)

func spawn():
	var spawn_instance = spawn_reference.instance()
	
	get_parent().add_child(spawn_instance)
	spawn_instance.global_translate(global_position)
