extends Sprite

var pos_ratoli := Vector2.ZERO
var velocitat := Vector2.ZERO
var n_projectils := 0

export var escena_projectil : PackedScene
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _process(delta):
	velocitat = Vector2.ZERO
	if Input.is_action_just_pressed("clic"):
		pos_ratoli = get_global_mouse_position()
		
		var nou_projectil = escena_projectil.instance()
		nou_projectil.global_position = global_position
		n_projectils += 1
		nou_projectil.velocitat *= n_projectils
		
		Global.Projectils.add_child(nou_projectil)
		
	if Input.is_action_pressed("ui_left"):
		velocitat += Vector2.LEFT * 200
	if Input.is_action_pressed("ui_right"):
		velocitat += Vector2.RIGHT * 200
	position += velocitat * delta

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
