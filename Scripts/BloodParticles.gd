extends Particles2D

var velocity = Vector2(0,0)
var lastpos = Vector2(0,0)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	velocity = (global_position - lastpos) / delta
	lastpos = global_position
	
	process_material.set_direction(Vector3(-velocity.x, -velocity.y, 0))
	
	emitting = velocity.length() > 50
	
	process_material.initial_velocity = clamp(velocity.length() / 10, 80, 120)
