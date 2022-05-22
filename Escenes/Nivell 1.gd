extends Node2D

var Ninja_health = 100
var MaskDude_health = 100
var dmg = 20
var Ninja_heal_left = 1
var Mask_heal_left = 1

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Mort_body_entered(body):
	
	if body.is_in_group("Ninja"):
		body.damage_player(dmg)
		Ninja_health -= dmg

	if body.is_in_group("Mask_dude"):
		body.damage_player(dmg)
		MaskDude_health -= dmg
		
	
	game_over()
	
func game_over():
	
	if MaskDude_health <= 0 or Ninja_health <= 0:
		get_tree().change_scene("res://Escenes/GAME OVER.tscn")
		MaskDude_health = 100
		Ninja_health = 100
	else:
		pass



func _on_Trampoline_body_entered(body):
	
	$Trampoline/AnimatedSprite.play("Pressed")
	$Trampoline2/AnimatedSprite.play("Pressed")
	$Trampoline3/AnimatedSprite.play("Pressed")

	if body.is_in_group("Ninja"):
		$Ninja_frog.speed.y = -800

	if body.is_in_group("Mask_dude"):
		$KinematicBody2D.velocitat.y = -800
		
	$TimerTrampolin.start()

func _on_TimerTrampolin_timeout():
	
	$Trampoline/AnimatedSprite.play("Idle")
	$Trampoline2/AnimatedSprite.play("Idle")
	$Trampoline3/AnimatedSprite.play("Idle")

func _on_Portal_body_entered(body):
	
	get_tree().change_scene("res://Escenes/Nivell 2.tscn")
	
func _on_Start_point_body_entered(body):
	
	$Start_point/AnimatedSprite.play("Moving")
	$Start_point2/AnimatedSprite.play("Moving")
	$TimerStart.start()

func _on_TimerStart_timeout():
	
	$Start_point/AnimatedSprite.play("Idle")
	$Start_point2/AnimatedSprite.play("Idle")

func _on_Apple_body_entered(body):
	
	$Apple/AnimatedSprite.play("Collect")
	$Apple2/AnimatedSprite.play("Collect")
	$TimerApple.start()
	
	if body.is_in_group("Ninja"):
		if Ninja_heal_left > 0.1:
			body.heal_player(dmg)
			Ninja_health += dmg
			Ninja_heal_left -= 1
			
	if body.is_in_group("Mask_dude"):
		if Mask_heal_left > 0.1:
			body.heal_player(dmg)
			MaskDude_health -= dmg
			Mask_heal_left -= 1

func _on_TimerApple_timeout():
	
	$Apple/AnimatedSprite.play("Idle")
	$Apple2/AnimatedSprite.play("Idle")
