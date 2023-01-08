extends Node2D

var current_tool = "Hand"



func _ready():
	$"Alien placeholder/XRAY placeholder".show()
	$Organs/AnimationPlayer.play("Beating")


func _on_Toolbar_tool_changed(new_tool):
	current_tool = new_tool


func _on_Alien_Guts_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		$Alien.hide()
		$"Alien Guts".hide()
		$Organs.show()
