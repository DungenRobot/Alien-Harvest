extends StaticBody2D


func _on_Tube1_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT and $"../../..".current_tool == "Scalple":
		hide()
		$"../../..".tubes -= 1


func _on_Tube2_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT and $"../../..".current_tool == "Scalple":
		hide()
		$"../../..".tubes -= 1


func _on_Tube3_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT and $"../../..".current_tool == "Scalple":
		hide()
		$"../../..".tubes -= 1
