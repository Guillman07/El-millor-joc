extends Area2D

const bullet_scene = preload("res://Escenes/Dark_attack.tscn")
onready var shoot_timer = $ShootTimer
onready var rotater = $Rotater

const rotate_speed = 80
const shooter_timer_wait_time = 0.2
const spawpoint_point_count = 3
const radius = 100
var health = 1000

func _ready():
	var step = 2 * PI / spawpoint_point_count
	for i in range(spawpoint_point_count):
		var spawn_point = Node2D.new()
		var pos = Vector2(radius , 0).rotated(step * 1)
		spawn_point.position = pos
		spawn_point.rotation = pos.angle()
		rotater.add_child(spawn_point)
		
	shoot_timer.wait_time = shooter_timer_wait_time
	shoot_timer.start()


func _process(delta):
	var new_rotation = rotater.rotation_degrees + rotate_speed * delta
	rotater.rotation_degrees = fmod(new_rotation , 360)

func damage_Boss(damage):
	
	health -= damage
#	$TextureProgress.value = health
	$Tween.interpolate_property($TextureProgress,'value',$TextureProgress.value, health, 0.2,Tween.TRANS_LINEAR)
	$Tween.start()



func _on_ShootTimer_timeout():
	for s in rotater.get_children():
		var bullet = bullet_scene.instance()
		get_tree().root.add_child(bullet)
		bullet.position = s.global_position
		bullet.rotation = s.global_rotation
		
