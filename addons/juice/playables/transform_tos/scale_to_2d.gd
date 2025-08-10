@tool
class_name ScaleTo2D
extends Playable2D
## This node scales to the specified destination with the specified parameters.

#/##########################/# EXPORTS #/##########################/#

## The destination of this playable.
@export var destination := Vector2.ONE

## The max speed in scale factor units per second.
@export_range(0.0, 16.0) var max_speed := 4.0

## The acceleration in scale factor units per second per second.
@export_range(0.0, 64.0) var acceleration := 16.0

## The deceleration in scale factor units per second per second.
@export_range(0.0, 64.0) var deceleration := 16.0

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
	scale = scale.move_toward(destination, speed * delta)
	
	if scale.is_equal_approx(destination):
		scale = destination
		return true
	else:
		return false

#/##########################/# END #/##########################/#
