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


func _on_Area2D_body_entered(body):
	
	if body.is_in_group("Ninja"):
		$Area2D/Trophy.play("Pressed")
		$TimerTrophy.start()

	if body.is_in_group("Mask_dude"):
		$Area2D/Trophy.play("Pressed")
		$TimerTrophy.start()
	
func _on_TimerTrophy_timeout():
	
	$Area2D/Trophy.play("Idle")
	get_tree().change_scene("res://Escenes/Menú_definitiu.tscn")
	
func _on_Trampoline_body_entered(body):
	
	$Trampoline/AnimatedSprite.play("Pressed")
	$Trampoline2/AnimatedSprite.play("Pressed")
	$Trampoline3/AnimatedSprite.play("Pressed")
	$Trampoline4/AnimatedSprite.play("Pressed")
	$Trampoline5/AnimatedSprite.play("Pressed")
	$Trampoline6/AnimatedSprite.play("Pressed")
	#$Trampoline7/AnimatedSprite.play("Pressed")
	#$Trampoline8/AnimatedSprite.play("Pressed")
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
	#$Trampoline7/AnimatedSprite.play("Idle")
	#$Trampoline8/AnimatedSprite.play("Idle")
	#$Trampoline9/AnimatedSprite.play("Idle")
	#$Trampoline10/AnimatedSprite.play("Idle")





func _on_Flag_body_entered(body):
	
	if body.is_in_group("Ninja"):
		$Flag/AnimatedSprite.play("Flag_out")
		$TimerFlag.start()

	if body.is_in_group("Mask_dude"):
		$Flag/AnimatedSprite.play("Flag_out")
		$TimerFlag.start()

	
func _on_TimerFlag_timeout():
	
	$Flag/AnimatedSprite.play("Flag_idle")




func _on_Flag2_body_entered(body):
	
	if body.is_in_group("Ninja"):
		$Flag2/AnimatedSprite.play("Flag_out")
		$TimerFlag2.start()

	if body.is_in_group("Mask_dude"):
		$Flag2/AnimatedSprite.play("Flag_out")
		$TimerFlag2.start()
	
func _on_TimerFlag2_timeout():
	
	$Flag2/AnimatedSprite.play("Flag_idle")
	



func _on_Flag3_body_entered(body):
	
	if body.is_in_group("Ninja"):
		$Flag3/AnimatedSprite.play("Flag_out")
		$TimerFlag3.start()

	if body.is_in_group("Mask_dude"):
		$Flag3/AnimatedSprite.play("Flag_out")
		$TimerFlag3.start()
	
func _on_TimerFlag3_timeout():
	
	$Flag3/AnimatedSprite.play("Flag_idle")




func _on_Flag4_body_entered(body):
	
	if body.is_in_group("Ninja"):
		$Flag4/AnimatedSprite.play("Flag_out")
		$TimerFlag4.start()

	if body.is_in_group("Mask_dude"):
		$Flag4/AnimatedSprite.play("Flag_out")
		$TimerFlag4.start()
	
func _on_TimerFlag4_timeout():
	
	$Flag4/AnimatedSprite.play("Flag_idle")



func _on_Flag5_body_entered(body):
	
	if body.is_in_group("Ninja"):
		$Flag5/AnimatedSprite.play("Flag_out")
		$TimerFlag5.start()

	if body.is_in_group("Mask_dude"):
		$Flag5/AnimatedSprite.play("Flag_out")
		$TimerFlag5.start()
	
func _on_TimerFlag5_timeout():
	
	$Flag5/AnimatedSprite.play("Flag_idle")
