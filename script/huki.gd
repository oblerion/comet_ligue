extends Node3D

# How fast the player moves in meters per second.
@export var speed = 1
@export var shoot_range = 0.4
# The downward acceleration when in the air, in meters per second squared.
@export var fall_acceleration = 75
func can_shoot(comet:Node3D)->bool :
	var dposx = abs(position.x-comet.position.x)
	var dposz = abs(position.z-comet.position.z)
	var dpos = dposx+dposz
	if dpos<shoot_range:
		return true
	return false
	
func move(pdelta:float):
	var target_velocity = Vector3.ZERO
	var direction = Vector3.ZERO
	if Input.is_action_pressed("ui_right"):
		rotate_y(-1*(speed+1)*pdelta)
	if Input.is_action_pressed("ui_left"):
		rotate_y((speed+1)*pdelta)
	if Input.is_action_pressed("ui_up"):
		direction.z += 1
	if Input.is_action_pressed("ui_down"):
		direction.z -= 1
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		#$Pivot.basis = looking_at(direction)
	# Ground Velocity
	target_velocity.x = direction.x * speed * pdelta
	target_velocity.z = direction.z * speed * pdelta
	## Vertical Velocity
	#if not is_on_floor(): # If in the air, fall towards the floor. Literally gravity
		#target_velocity.y = target_velocity.y - (fall_acceleration * delta)
	# Moving the Character
	translate(target_velocity)


