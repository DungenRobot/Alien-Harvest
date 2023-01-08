extends Sprite

signal tool_changed(new_tool)

enum tools {
	XRAY,
	SCALPLE,
	TAPE,
	SYRINGE,
	SHARPIE
}


func _on_XRay_input_event(_viewport, event, _shape_idx):
	var result = send_change(event, "X-Ray")
	if result: $"X-Ray".hide()

func _on_Scalple_input_event(_viewport, event, _shape_idx):
	var result = send_change(event, "Scalple")
	if result: $Scalple.hide()

func _on_Tape_input_event(_viewport, event, _shape_idx):
	var result = send_change(event, "Tape")
	if result: $Tape.hide()

func _on_Syringe_input_event(_viewport, event, _shape_idx):
	var result = send_change(event, "Syringe")
	if result: $Syringe.hide()

func _on_Sharpie_input_event(_viewport, event, _shape_idx):
	var result = send_change(event, "Sharpie")
	if result: $Sharpie.hide()



func send_change(event, toolID):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		emit_signal("tool_changed", toolID)
		make_children_visible()
		return true
	return false

func make_children_visible():
	for child in get_children():
		child.show()



func _on_ToolBarCollider_mouse_entered():
	make_children_visible()
	emit_signal("tool_changed", "Hand")
