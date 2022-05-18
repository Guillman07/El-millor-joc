extends Node

var Projectils : Node2D


func _on_Area2D_body_entered(body):
	if body.get_name() == "Ninja":
		$Ninja_frog "hit"
	
	#get_tree().change_scene("res://Escenes/Menú_definitiu.tscn")
	

