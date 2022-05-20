extends Node2D

var Ninja_health = 100
var MaskDude_health = 100
var dmg = 20

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



	
func _on_Area2D_body_entered(body):
	
	$Trampoline/AnimatedSprite.play("Pressed")
	
	if body.is_in_group("Ninja"):
		$Ninja_frog.velocitat.y = -800

	if body.is_in_group("Mask_dude"):
		$KinematicBody2D.velocitat.y = -800
		
	$TimerTrampolin.start()


func _on_TimerTrampolin_timeout():
	
	$Trampoline/AnimatedSprite.play("Idle")
