extends Control

var mouse_entered = false
var on_fullscreen_mode = true

func _physics_process(delta):
	if on_fullscreen_mode:
		OS.window_fullscreen = true
	elif !on_fullscreen_mode:
		OS.window_fullscreen = false

func _ready():
	$controls/startBTN.grab_focus()

func _on_startBTN_pressed():
	get_tree().change_scene("res://scenes/main.tscn")

func _on_quitBTN_pressed():
	get_tree().quit()

func _on_controlsBTN_pressed():
	get_tree().change_scene("res://prefabs/control_screen.tscn")

func _on_button_mouse_entered():
	$controls/startBTN.release_focus()
	
func _input(event):
	if event.is_action_pressed("ui_focus_next"):
		$controls/startBTN.grab_focus()

func _on_TextureButton_pressed():
	on_fullscreen_mode = !on_fullscreen_mode
