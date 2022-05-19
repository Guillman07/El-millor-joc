extends Position2D

func _process(delta):
	global_position = (Global.Ninja.global_position + Global.MaskDude.global_position)/2.0
