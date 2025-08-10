@tool
class_name TranslateTo2D
extends Playable2D
## This node translates to the specified destination with the specified
## parameters.

#/##########################/# EXPORTS #/##########################/#

## The destination of this playable in pixels.
@export var destination := Vector2.ZERO

## The max speed in pixels per second.
@export var max_speed := 256.0

## The acceleration in pixels per second per second.
@export var acceleration := 1024.0

## The deceleration in pixels per second per second.
@export var deceleration := 1024.0

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
	position = position.move_toward(destination, speed * delta)
	
	if position.is_equal_approx(destination):
		position = destination
		return finish_at_destination
	else:
		return false

#/##########################/# END #/##########################/#
