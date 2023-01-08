extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _on_Start_button_down():
	get_tree().change_scene("res://Scenes/Main.tscn")



func _on_Instruct_button_down():
	$Label.show()
