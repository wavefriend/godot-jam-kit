@tool
class_name RotateBy2D
extends Node2D
## This node rotates by the specified displacement with the specified
## parameters.

#/##########################/# EXPORTS #/##########################/#

## The remaining displacement of this playable in degrees.
@export var displacement := 0.0

## The max speed in degrees per second.
@export var max_speed := 360.0

## The acceleration in degrees per second per second.
@export var acceleration := 1440.0

## The deceleration in degrees per second per second.
@export var deceleration := 1440.0

## If true, the playable finishes when the displacement reaches zero.
@export var finish_after_displacement := true

#/##########################/# VARIABLES #/##########################/#

var speed := 0.0

#/##########################/# EVENTS #/##########################/#

func _on_play() -> void:
	speed = 0.0


func _on_stop() -> void:
	speed = 0.0


func _on_step(delta: float) -> bool:
	# TODO Implement deceleration
	
	speed = move_toward(speed, max_speed, acceleration * delta)
	var new_rotation_degrees := move_toward(rotation_degrees, rotation_degrees + displacement, speed * delta)
	displacement -= (new_rotation_degrees - rotation_degrees)
	rotation_degrees = new_rotation_degrees
	
	if is_zero_approx(displacement):
		rotation_degrees += displacement
		return finish_after_displacement
	else:
		return false

#/##########################/# END #/##########################/#
