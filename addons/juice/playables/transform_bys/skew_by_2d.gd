@tool
class_name SkewBy2D
extends Node2D
## This node skews by the specified displacement with the specified parameters.

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
	var skew_degrees := rad_to_deg(skew)
	var new_skew_degrees := move_toward(skew_degrees, skew_degrees + displacement, speed * delta)
	displacement -= (new_skew_degrees - skew_degrees)
	skew = deg_to_rad(new_skew_degrees)
	
	if is_zero_approx(displacement):
		skew += deg_to_rad(displacement)
		return finish_after_displacement
	else:
		return false

#/##########################/# END #/##########################/#
