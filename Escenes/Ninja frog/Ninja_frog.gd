extends KinematicBody2D

var base_speed = 300
var speed = Vector2.ZERO
var direccio = Vector2.DOWN
var gravetat = Vector2.DOWN * 980
var jump_speed = -300
var left_jumps = 1
#signal hit
var health : int = 100
#var velocitat_avall = 1000
var damage = 20
var apareixent = true
var rebent = false

func _ready():
	Global.Ninja = self
	$AnimatedSprite.play("Appear")
	
func _physics_process(delta):
	
	#if Input.is_action_pressed("Attack_Ninja"):
	#	fire()
	speed.x = 0
	speed += gravetat * delta
	if Input.is_action_pressed("Right 1"):
		speed += Vector2.RIGHT * base_speed
	if Input.is_action_pressed("Left 1"):
		speed += Vector2.LEFT * base_speed
	if Input.is_action_just_pressed("Up 1"):
		if left_jumps > 0:
			speed.y = jump_speed
			left_jumps -= 1
	if is_on_floor():
		left_jumps = 1
		
#if Input.is_action_just_pressed("Down 2") and is_on_floor():
#velocitat.y = velocitat_avall



	speed = move_and_slide(speed, Vector2.UP)
	animation(speed)

func animation(speed):
	if not apareixent and not rebent:
		if speed.x > 0.1:
			$AnimatedSprite.play("Run")
			$AnimatedSprite.flip_h = false
		elif speed.x < -0.1:
			$AnimatedSprite.play("Run")
			$AnimatedSprite.flip_h = true
		
		if abs(speed.x) < 0.1:
			$AnimatedSprite.play("Idle")
			
		if speed.y < -2:
			$AnimatedSprite.play("Jump")

func damage_player(damage):
	
	health -= damage
	rebent = true
	$AnimatedSprite.play("Hit")
#	$TextureProgress.value = health
	$Tween.interpolate_property($TextureProgress,'value',$TextureProgress.value, health, 0.2,Tween.TRANS_LINEAR)
	$Tween.start()
	
func heal_player(damage):
	
	health += damage
	$Tween.interpolate_property($TextureProgress,'value',$TextureProgress.value, health, 0.2,Tween.TRANS_LINEAR)
	$Tween.start()

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == 'Appear':
		apareixent = false
	if $AnimatedSprite.animation == 'Hit':
		rebent = false

