extends KinematicBody2D

var velocitat_base = 300 #la velocitat inicial
var velocitat = Vector2.ZERO
var direccio = Vector2.DOWN
var gravetat = Vector2.DOWN * 980
var velocitat_salt = -300
var salts = 1
var health : int = 100
#var velocitat_avall = 1000
var damage = 20
func _ready():
	Global.MaskDude = self
	$Timer.start()
	$MASKDUDE.play("Appear")

func _on_Timer_timeout():
	if $MASKDUDE.animation == 'Appear':
		$MASKDUDE.play('Idle')

func _physics_process(delta):
	velocitat.x = 0
	velocitat += gravetat * delta
	if Input.is_action_pressed("Right 2"):
		velocitat += Vector2.RIGHT * velocitat_base
	if Input.is_action_pressed("Left 2"):
		velocitat += Vector2.LEFT * velocitat_base
	if Input.is_action_just_pressed("Up 2"):
		if salts > 0:
			velocitat.y = velocitat_salt
			salts -= 1
	if is_on_floor():
		salts = 1
		
	#if Input.is_action_just_pressed("Down 2") and is_on_floor():
		#velocitat.y = velocitat_avall
	#$TextureProgress.value = health
	
	
	velocitat = move_and_slide(velocitat, Vector2.UP)
	#print(get_slide_count())
	animation(velocitat)
	
func animation(velocitat):
	
	if velocitat.x > 0.1:
		$MASKDUDE.play("Run")
		$MASKDUDE.flip_h = false
	elif velocitat.x < -0.1:
		$MASKDUDE.play("Run")
		$MASKDUDE.flip_h = true
		
	if abs(velocitat.x) < 0.1:
		$MASKDUDE.play("Idle")
		
	if velocitat.y < -2:
		$MASKDUDE.play("Jump")
		
	if velocitat.y > -2:
		$MASKDUDE.play()
		
func damage_player(damage):
	health -= damage 
	$MASKDUDE.play("Hit")
	$Tween.interpolate_property($TextureProgress,'value',$TextureProgress.value, health, 0.2,Tween.TRANS_LINEAR)
	$Tween.start()


#func _on_Respawn_body_entered(body):
	#position = Vector2(-133, 149)

func _on_Area2D2_body_entered(body):
	velocitat.y = -800


func _on_Area2D4_body_entered(body):
	velocitat.y = -800

func heal_player(damage):
	
	health += damage
	$Tween.interpolate_property($TextureProgress,'value',$TextureProgress.value, health, 0.2,Tween.TRANS_LINEAR)
	$Tween.start()
