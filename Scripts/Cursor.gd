extends Node2D

var mouse_pos

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func _process(delta):
	position = mouse_pos


func _unhandled_input(event):
	if event is InputEventMouseMotion:
		mouse_pos = event.position
