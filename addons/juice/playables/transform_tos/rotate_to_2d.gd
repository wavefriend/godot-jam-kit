@tool
class_name RotateTo2D
extends Playable2D
## This node rotates to the specified destination with the specified parameters.

#/##########################/# EXPORTS #/##########################/#

## The destination of this playable in radians.
@export var destination := 0.0

## The destination of this playable in degrees.
@export var destination_degrees := 0.0 : set = set_destination_degrees

## The max speed in scale factor units per second.
@export_range(0.0, 16.0) var max_speed := 4.0

## The acceleration in scale factor units per second per second.
@export_range(0.0, 64.0) var acceleration := 16.0

## The deceleration in scale factor units per second per second.
@export_range(0.0, 64.0) var deceleration := 16.0

#/##########################/# VARIABLES #/##########################/#

var speed := 0.0

#/##########################/# SETGET #/##########################/#

## TODO We cannot make this a setter without an infinite loop
func set_destination(new_destination: float) -> void:
	destination = new_destination
	destination_degrees = rad_to_deg(destination)


func set_destination_degrees(new_destination_degrees: float) -> void:
	destination_degrees = new_destination_degrees
	destination = deg_to_rad(destination_degrees)

#/##########################/# EVENTS #/##########################/#

func _on_play() -> void:
	speed = 0.0


func _on_stop() -> void:
	speed = 0.0


func _on_step(delta: float) -> bool:
	# TODO Implement deceleration
	
	# TODO take shortest path
	speed = move_toward(speed, max_speed, acceleration * delta)
	rotation = move_toward(rotation, destination, speed * delta)
	
	# TODO check 2pi mod
	if is_equal_approx(rotation, destination):
		rotation = destination
		return true
	else:
		return false

#/##########################/# END #/##########################/#
