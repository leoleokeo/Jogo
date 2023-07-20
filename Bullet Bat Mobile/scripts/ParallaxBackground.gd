extends ParallaxBackground

export var speed: float = 1.0

func _process(delta: float) -> void:
	var parallax_layers = get_children()
	for layer in parallax_layers:
		var parallax_layer = layer as ParallaxLayer
		parallax_layer.motion_scale.x += speed * delta
