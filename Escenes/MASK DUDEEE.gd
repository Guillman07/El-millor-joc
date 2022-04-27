extends KinematicBody2D

var velocitat_base = 200 #la velocitat inicial
var velocitat = Vector2.ZERO
var direccio = Vector2.DOWN
var gravetat = Vector2.DOWN * 980
var velocitat_salt = -340

func _physics_process(delta):
	velocitat.x = 0
	velocitat += gravetat * delta
	if Input.is_action_pressed("mou dreta"):
		velocitat += Vector2.RIGHT * velocitat_base
	if Input.is_action_pressed("mou esquerra"):
		velocitat += Vector2.LEFT * velocitat_base
	if Input.is_action_just_pressed("mou amunt") and is_on_floor():
		velocitat.y = velocitat_salt
		
	
	
	velocitat = move_and_slide(velocitat, Vector2.UP)
	animation(velocitat)
func animation(velocitat):
	if velocitat.x > 0 and velocitat.y > -2:
		$"MASK DUDE".play("Run")
		$"MASK DUDE".flip_h = false
	elif velocitat.x < 0 and velocitat.y > -2:
		$"MASK DUDE".play("Run")
		$"MASK DUDE".flip_h = true
		
	if abs(velocitat.x) < 0.1 and velocitat.y > -1:
		$"MASK DUDE".play("Idle")
		
	if velocitat.y < -2:
		$"MASK DUDE".play("Jump")

 


#func _on_Respawn_body_entered(body):
	#position = Vector2(-133, 149)
