@tool
class_name ScaleTo2D
extends Playable2D
## This node scales to the specified destination with the specified parameters.

#/##########################/# EXPORTS #/##########################/#

## The destination of this playable in scale factor units.
@export var destination := Vector2.ONE

## The max speed in scale factor units per second.
@export var max_speed := 1.0

## The acceleration in scale factor units per second per second.
@export var acceleration := 4.0

## The deceleration in scale factor units per second per second.
@export var deceleration := 4.0

## If true, the playable finishes when it reaches the destination.
@export var finish_at_destination := true

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
		return finish_at_destination
	else:
		return false

#/##########################/# END #/##########################/#
