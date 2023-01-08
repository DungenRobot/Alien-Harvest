extends Node2D

var current_tool = "Hand"

var popped_polyps = 0

var tubes = 3.0

func _ready():
	pass
	#$"Alien placeholder/XRAY placeholder".show()
	#$"Organs/Polyps/Polyp Timer".start()

func _process(_delta):
	if popped_polyps > 3:
		game_over()
	$Organs/AnimationPlayer.playback_speed = tubes / 3
	if tubes < 1:
		$Organs/AnimationPlayer.stop()
		$Organs/Section2.hide()
		$Organs/Section1.hide()
		$Organs/Replacement.show()
		tubes = 5

func _on_Toolbar_tool_changed(new_tool):
	current_tool = new_tool


func _on_Alien_Guts_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		$Alien.hide()
		$"Alien Guts".hide()
		$Organs.show()
		$"Organs/Polyps/Polyp Timer".start()


func _on_Polyp_Timer_timeout():
	var children = $Organs/Polyps.get_children()
	var i = 0
	
	while i < 3:
		var child = children[randi()%children.size()]
		if child is Timer: continue
		i += 1
		if child.is_visible(): continue
		
		child._start()
		
		return
	$"Organs/Polyps/Polyp Timer".start()

func game_over():
	$Organs.pause_mode = PAUSE_MODE_STOP
	$Organs/AnimationPlayer.stop()
	$"Organs/Polyps/Polyp Timer".stop()
	for child in $Organs/Polyps.get_children():
		if child is Timer: continue
		child.out_fail()
	current_tool = "Hand"
	$Cursor._on_Toolbar_tool_changed("Hand")
	$"Game End Tint".show()


func _on_Lines_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT and current_tool == "Scalple":
		$Lines.hide()
		$"Alien Guts".show()


func _on_Draw_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT and current_tool == "Sharpie":
		$Draw.hide()
		$Lines.show()


func _on_Replacement_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT and current_tool == "Tape":
		$Organs/Replacement/Tape.show()
		$"Game End Tint".show()
		$Organs.pause_mode = PAUSE_MODE_STOP
		$Organs/AnimationPlayer.stop()
		$"Organs/Polyps/Polyp Timer".stop()
		for child in $Organs/Polyps.get_children():
			if child is Timer: continue
			child.queue_free()
		current_tool = "Hand"
		$Cursor._on_Toolbar_tool_changed("Hand")
