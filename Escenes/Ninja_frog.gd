extends KinematicBody2D


# Declare member variables here. Examples:
var speed = 300
var gravity = Vector2.DOWN * 980
var jump_speed = -300


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("Appear")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == 'Appear':
		$AnimatedSprite.play('Idle')
		
func _physics_process(delta):
	
	speed.x = 0
	speed += gravity * delta
	
	if Input.is_action_just_pressed("Right 1"):#a
		speed = Vector2.RIGHT * speed
		
	if Input.is_action_just_pressed("Left 1"):#d
		speed = Vector2.LEFT * speed
	
	if Input.is_action_just_pressed("Up 1") and is_on_floor():#w
		speed.y = jump_speed
		
