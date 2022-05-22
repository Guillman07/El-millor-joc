extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("Idle")
	$Timer.start()

#func _process(delta):
#	pass

func _on_Timer_timeout():
	$AnimatedSprite.play("Blink")
	$Timer2.start()
	



func _on_Timer2_timeout():
	$AnimatedSprite.play("Idle")
