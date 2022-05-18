extends Node

var Projectils : Node2D
var damage = 20

func _on_Area2D_body_entered(body):
	if body.is_in_group("Ninja"):
		#$Ninja_frog damage
		pass
	if body.is_in_group("Mask_dude"):
		body.damage_player(damage)
	print("aDETECT")
	#get_tree().change_scene("res://Escenes/Menú_definitiu.tscn")
	

