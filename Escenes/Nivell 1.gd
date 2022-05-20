extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Mort_body_entered(body):
	get_tree().change_scene("res://Escenes/GAME OVER.tscn")


	
func _on_Area2D_body_entered(body):
	
	$Trampoline/AnimatedSprite.play("Pressed")
	
	if body.is_in_group("Ninja"):
		$Ninja_frog.velocitat.y = -800

	if body.is_in_group("Mask_dude"):
		$KinematicBody2D.velocitat.y = -800
		
	$TimerTrampolin.start()


func _on_TimerTrampolin_timeout():
	
	$Trampoline/AnimatedSprite.play("Idle")
