extends Control


func _ready():
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://Escenes/Nivell 2.tscn")

func _on_Nivell2_pressed():
	get_tree().change_scene("res://Escenes/Nivell 2.tscn")


func _on_menu_pressed():
	get_tree().change_scene("res://Escenes/Menú_definitiu.tscn")
