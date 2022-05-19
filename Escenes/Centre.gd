extends Position2D

func _process(delta):
	var pos_inicial = global_position
	var pos_final = (Global.Ninja.global_position + Global.MaskDude.global_position)/2.0
	$Tween.interpolate_property(self, 'global_position', pos_inicial, pos_final, 0.1, Tween.TRANS_LINEAR)
	$Tween.start()
	global_position = pos_final
