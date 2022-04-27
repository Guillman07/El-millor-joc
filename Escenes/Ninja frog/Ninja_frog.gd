extends KinematicBody2D

var base_speed = 300
var speed = Vector2.ZERO
var direccio = Vector2.DOWN
var gravetat = Vector2.DOWN * 980
var jump_speed = -400
var left_jumps = 1
signal hit


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
	#position += speed * direccio * delta
	speed.x = 0
	speed += gravetat * delta
	
	if Input.is_action_just_pressed("Up 1")and is_on_floor():
		speed.y = jump_speed
	if Input.is_action_just_pressed("Right 1"):
		speed += Vector2.RIGHT * base_speed
	if Input.is_action_just_pressed("Left 1"):
		speed += Vector2.LEFT * base_speed
	if Input.is_action_just_pressed("Up 1"):
		if left_jumps == 1:
			speed.y = jump_speed
			left_jumps -= 1
		
		
	
	
	speed = move_and_slide(speed , Vector2.UP)# * direccio)
	animation(speed)
	
func animation(speed):
	if speed.x > 0 and speed.y > -2:
		$ninja_frog.play("Run")
		$ninja_frog.flip_h = false
	elif speed.x < 0 and speed.y > -2:
		$ninja_frog.play("run")
		$ninja_frog.flip_h = true
	
	if abs(speed.x) < 0.1 and speed.y > -1:
		$ninja_frog.play("idle")
		
	if speed.y < -2:
		$ninja_frog.play("jump")
	
#func start(pos):
	#position = pos
	#show()
	#$CollisionShape2D.Disabled = false
	
#func _on_Area2D_body_entered(body):
	#get_tree().change_scene("res://escenes/pantalla cossos.tscn")

	
