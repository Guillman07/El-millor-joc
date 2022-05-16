extends Node

var Projectils : Node2D


func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://Escenes/Menú_definitiu.tscn")
	

