extends KinematicBody2D

var velocity = Vector2(1,0)
var speed = 1000
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	var collision_info = move_and_collide(velocity.normalized() * delta * speed)
	$AnimationPlayer.play("gia")
	
	if collision_info != null:
		queue_free()
	
		
	
