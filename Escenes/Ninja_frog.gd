extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("Appear")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == 'Appear':
		$AnimatedSprite.play('Idle')
		
	if Input.is_action_just_pressed("Right 1"):
		
	if Input.is_action_just_pressed("R"):
	if Input.is_action_just_pressed("Right 1"):
	if Input.is_action_just_pressed("Right 1"):
