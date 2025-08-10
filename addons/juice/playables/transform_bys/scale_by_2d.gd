@tool
class_name ScaleBy2D
extends Node2D
## This node scales by the specified displacement with the specified 
## parameters.

#/##########################/# EXPORTS #/##########################/#

## The remaining displacement of this playable in scale factor units.
@export var displacement := Vector2.ZERO

## The max speed in scale factor units per second.
@export var max_speed := 1.0

## The acceleration in scale factor units per second per second.
@export var acceleration := 4.0

## The deceleration in scale factor units per second per second.
@export var deceleration := 4.0

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
	var new_scale := scale.move_toward(scale + displacement, speed * delta)
	displacement -= (new_scale - scale)
	scale = new_scale
	
	if displacement.is_zero_approx():
		scale += displacement
		return true
	else:
		return false

#/##########################/# END #/##########################/#
