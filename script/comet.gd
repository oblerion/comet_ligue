extends Node3D

@export var speed=1
var v3speed = Vector3.ZERO

func set_move(huki:Node3D,delta:float):
	#var rot = atan2(position.y-huki.position.y,position.x-huki.position.x)
	v3speed.x = cos(huki.rotation.y+deg_to_rad(45/2))*speed*delta
	v3speed.z = sin(huki.rotation.y+deg_to_rad(45/2))*speed*delta
	v3speed.y = 0

func stop_move():
	v3speed = Vector3.ZERO

func update():
	translate(v3speed)
	
