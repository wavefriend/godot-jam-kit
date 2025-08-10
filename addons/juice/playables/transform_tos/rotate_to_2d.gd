@tool
class_name RotateTo2D
extends Playable2D
## This node rotates to the specified destination with the specified parameters.

#/##########################/# EXPORTS #/##########################/#

## The destination of this playable in degrees.
@export var destination := 0.0

## The max speed in degrees per second.
@export var max_speed := 360.0

## The acceleration in degrees per second per second.
@export var acceleration := 1440.0

## The deceleration in degrees per second per second.
@export var deceleration := 1440.0

#/##########################/# VARIABLES #/##########################/#

var speed := 0.0

#/##########################/# EVENTS #/##########################/#

func _on_play() -> void:
	speed = 0.0


func _on_stop() -> void:
	speed = 0.0


func _on_step(delta: float) -> bool:
	# TODO Implement deceleration
	
	# TODO take shortest path
	speed = move_toward(speed, max_speed, acceleration * delta)
	rotation_degrees = move_toward(rotation_degrees, destination, speed * delta)
	
	# TODO check 2pi mod
	if is_equal_approx(rotation_degrees, destination):
		rotation_degrees = destination
		return true
	else:
		return false

#/##########################/# END #/##########################/#
