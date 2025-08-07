@tool
class_name Translate2D
extends Node2D

#/##########################/# SIGNALS #/##########################/#

## Emitted once the animation has reached its destination.
signal finished()

#/##########################/# EXPORTS #/##########################/#

## The max speed in pixels per second.
@export_range(0.0, 1024.0) var max_speed := 256.0

## The acceleration in pixels per second per second.
@export_range(0.0, 8192.0) var acceleration := 1024.0

## The deceleration in pixels per second per second.
@export_range(0.0, 8192.0) var deceleration := 1024.0

#/##########################/# VARIABLES #/##########################/#

var playing := false

var destination := Vector2.ZERO

var speed := 0.0

#/##########################/# INIT #/##########################/#

func _ready() -> void:
	set_process(false)

#/##########################/# METHODS #/##########################/#

func translate_to(new_destination: Vector2) -> void:
	playing = true
	set_process(true)
	destination = new_destination
	speed = 0.0


func translate_by(new_displacement: Vector2) -> void:
	translate_to(position + new_displacement)


func stop() -> void:
	playing = false
	set_process(false)
	destination = Vector2.ZERO
	speed = 0.0

#/##########################/# GODOT #/##########################/#

func _process(delta: float) -> void:
	# TODO Implement deceleration
	
	speed = move_toward(speed, max_speed, acceleration * delta)
	position = position.move_toward(destination, speed * delta)
	
	if position.is_equal_approx(destination):
		position = destination
		stop()
		finished.emit()

#/##########################/# END #/##########################/#
