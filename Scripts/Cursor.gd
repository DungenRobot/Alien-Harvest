extends Node2D

var mouse_pos = Vector2(0,0)

var current_cursor = "Hand"

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	show()

func _process(_delta):
	position = mouse_pos

func _input(event):
	if event is InputEventMouseMotion:
		mouse_pos = event.position

func _on_Toolbar_tool_changed(new_tool):
	if new_tool == "X-Ray":
			$"X-Ray".position = Vector2.ZERO
			
	showhide(new_tool)

func _on_ToolBarCollider_mouse_entered():
	showhide("Hand")

# a function that hides every cursor object and shows the one inputted
func showhide(tool_name):
	current_cursor = tool_name
	for child in get_children():
		if child.name == tool_name: 
			child.show()
		else:
			if child.name == "X-Ray": 
				$"X-Ray".position = Vector2(0,4000)
				continue
			child.hide()


