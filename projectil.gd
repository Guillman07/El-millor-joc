extends Area2D

var velocitat = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func Front(delta):
	position.x += velocitat * delta
	
func up(delta):
	position.y += velocitat * delta
