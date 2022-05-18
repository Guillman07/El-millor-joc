extends Node

var Projectils : Node2D
var dmg = 20
var Ninja_health = 100
var MaskDude_health = 100

func _on_Area2D_body_entered(body):
	if body.is_in_group("Ninja"):
		body.damage_player(dmg)
		Ninja_health -= dmg

	if body.is_in_group("Mask_dude"):
		body.damage_player(dmg)
		MaskDude_health -= dmg
		print(MaskDude_health)
func game_over():
	if MaskDude_health <= 0 or Ninja_health <= 0:
		get_tree().change_scene("res://Escenes/GAME OVER.tscn")
		MaskDude_health = 100
		Ninja_health = 100

