extends StaticBody2D


func _start():
	show()
	$AnimationPlayer.play("Pop")
	

func _on_Pallup_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT and $AnimationPlayer.is_playing():
		if $"../../..".current_tool == "Syringe":
			$AnimationPlayer.stop()
			hide()
		if $"../../..".current_tool == "Scalple":
			$AnimationPlayer.stop()
			$Sprite.hide()
			$Popped.show()
			$"../../..".popped_polyps += 1

func _fail():
	$"../../..".popped_polyps += 1

func out_fail():
	$AnimationPlayer.stop()
	$Sprite.hide()
	$Popped.show()
	$CollisionShape2D.disabled = true
