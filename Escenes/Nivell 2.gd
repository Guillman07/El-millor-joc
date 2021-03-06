extends Node

var Projectils : Node2D
var dmg = 20
var Ninja_health = 100
var MaskDude_health = 100
var Ninja_heal_left = 1
var Mask_heal_left = 1
var boss_health = 1000

func _on_Die_body_entered(body):
	
	if body.is_in_group("Ninja"):
		body.damage_player(dmg)
		Ninja_health -= dmg

	if body.is_in_group("Mask_dude"):
		body.damage_player(dmg)
		MaskDude_health -= dmg
		
	
	game_over()
	
func game_over():
	
	if MaskDude_health <= 0 or Ninja_health <= 0:
		get_tree().change_scene("res://Escenes/Game_Over_Nivell2.tscn")
		MaskDude_health = 100
		Ninja_health = 100
	else:
		pass


func _on_Trampoline_body_entered(body):
	
	$Trampoline/AnimatedSprite.play("Pressed")
	$Trampoline2/AnimatedSprite.play("Pressed")
	$Trampoline3/AnimatedSprite.play("Pressed")
	$Trampoline4/AnimatedSprite.play("Pressed")
	$Trampoline5/AnimatedSprite.play("Pressed")
	$Trampoline6/AnimatedSprite.play("Pressed")
	$Trampoline7/AnimatedSprite.play("Pressed")
	$Trampoline8/AnimatedSprite.play("Pressed")
	#$Trampoline9/AnimatedSprite.play("Pressed")
	#$Trampoline10/AnimatedSprite.play("Pressed")
	
	if body.is_in_group("Ninja"):
		$Ninja_frog.speed.y = -800
		
	if body.is_in_group("Mask_dude"):
		$Pers2.velocitat.y = -800
		
	$TimerTrampolin.start()

func _on_TimerTrampolin_timeout():
	
	$Trampoline/AnimatedSprite.play("Idle")
	$Trampoline2/AnimatedSprite.play("Idle")
	$Trampoline3/AnimatedSprite.play("Idle")
	$Trampoline4/AnimatedSprite.play("Idle")
	$Trampoline5/AnimatedSprite.play("Idle")
	$Trampoline6/AnimatedSprite.play("Idle")
	$Trampoline7/AnimatedSprite.play("Idle")
	$Trampoline8/AnimatedSprite.play("Idle")
	#$Trampoline9/AnimatedSprite.play("Idle")
	#$Trampoline10/AnimatedSprite.play("Idle")

func _on_Portal_body_entered(body):
	if body.is_in_group("Ninja") and boss_health <= 0:
		get_tree().change_scene("res://Escenes/Pantalla_Final.tscn")
		
	if body.is_in_group("Mask_dude")and boss_health <= 0:
		get_tree().change_scene("res://Escenes/Pantalla_Final.tscn")

func _on_Start_point_body_entered(body):
	
	$Start_point/AnimatedSprite.play("Moving")
	$TimerStart.start()

func _on_TimerStart_timeout():
	
	$Start_point/AnimatedSprite.play("Idle")


func _on_Apple_body_entered(body):
	
	$Apple/AnimatedSprite.play("Collect")
	#$Apple2/AnimatedSprite.play("Collect")
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
	#$Apple2/AnimatedSprite.play("Idle")


func _on_Boss_body_entered(body):
	if body.is_in_group("Shuriken"):
		$Boss.damage_Boss(dmg)
		boss_health -= 20
		body.queue_free()
		
	if body.is_in_group("Ninja"):
		$Boss.damage_Boss(dmg)
		body.damage_player(dmg)
		Ninja_health -= dmg
		boss_health -= 20
	if body.is_in_group("Mask_dude"):
		$Boss.damage_Boss(dmg)
		body.damage_player(dmg)
		MaskDude_health -= dmg
		boss_health -= 20
	pass_level()
	
func pass_level():
	if boss_health <= 0:
		$Boss.queue_free()
		$Portal.show()


func _on_Mask_dude_area_entered(area):
	if area.is_in_group("Dark"):
		$Pers2.damage_player(dmg)
		MaskDude_health -= dmg
		area.queue_free()
	
	game_over()

func _on_Ninja_area_entered(area):
	if area.is_in_group("Dark"):
		$Ninja_frog.damage_player(dmg)
		Ninja_health -= dmg
		area.queue_free()
	
	game_over()
