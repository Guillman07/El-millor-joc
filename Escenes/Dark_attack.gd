extends Area2D

const speed = 100

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	position += transform.x * speed * delta


func _on_Dark_attack_body_entered(body):

	if body.is_in_group("Ninja"):
		pass

	if body.is_in_group("Mask_dude"):
		pass
		
		
	else:
		queue_free()
		
	
	
	
