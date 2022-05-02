extends KinematicBody2D

var velocitat_base = 300 #la velocitat inicial
var velocitat = Vector2.ZERO
var direccio = Vector2.DOWN
var gravetat = Vector2.DOWN * 980
var velocitat_salt = -300
var salts = 1
#var velocitat_avall = 1000

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
		
	
	
	velocitat = move_and_slide(velocitat, Vector2.UP)
	animation(velocitat)
func animation(velocitat):
	if velocitat.x > 0.1 and velocitat.y > -2:
		$MASKDUDE.play("Run")
		$MASKDUDE.flip_h = false
	elif velocitat.x < -0.1 and velocitat.y > -2:
		$MASKDUDE.play("Run")
		$MASKDUDE.flip_h = true
		
	if abs(velocitat.x) < 0.1 and velocitat.y > -1:
		$MASKDUDE.play("Idle")
		
	if velocitat.y < -2:
		$MASKDUDE.play("Jump")
		
	if velocitat.y > -2:
		$MASKDUDE.play()
		

 


#func _on_Respawn_body_entered(body):
	#position = Vector2(-133, 149)
