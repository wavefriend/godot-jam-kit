@tool
class_name TranslateBy2D
extends Playable2D
## This node translates by the specified displacement with the specified 
## parameters.

#/##########################/# EXPORTS #/##########################/#

## The remaining displacement of this playable in pixels.
@export var displacement := Vector2.ZERO

## The max speed in pixels per second.
@export_range(0.0, 1024.0) var max_speed := 256.0

## The acceleration in pixels per second per second.
@export_range(0.0, 8192.0) var acceleration := 1024.0

## The deceleration in pixels per second per second.
@export_range(0.0, 8192.0) var deceleration := 1024.0

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
	var new_position := position.move_toward(position + displacement, speed * delta)
	displacement -= (new_position - position)
	position = new_position
	
	if displacement.is_zero_approx():
		position += displacement
		return true
	else:
		return false

#/##########################/# END #/##########################/#
