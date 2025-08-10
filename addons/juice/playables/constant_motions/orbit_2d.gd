@tool
class_name Orbit2D
extends Playable2D
## This node orbits around a specified center without rotation at the specified
## angular velocity indefinitely or until stopped.

#/##########################/# EXPORTS #/##########################/#

## The center of the orbit in pixels.
@export var center := Vector2.ZERO

## The radius of the orbit in pixels.
@export_range(0.0, 1024.0) var radius := 64.0

## The angular velocity in radians per second.
@export var angular_velocity := 0.25 * PI

## The angular velocity in degrees per second.
@export var angular_velocity_degrees := 45.0 : set = set_angular_velocity_degrees

#/##########################/# SETGET #/##########################/#

## TODO We cannot make this a setter without an infinite loop
func set_angular_velocity(new_angular_velocity: float) -> void:
	angular_velocity = new_angular_velocity
	angular_velocity_degrees = rad_to_deg(angular_velocity)


func set_angular_velocity_degrees(new_angular_velocity_degrees: float) -> void:
	angular_velocity_degrees = new_angular_velocity_degrees
	angular_velocity = deg_to_rad(angular_velocity_degrees)

#/##########################/# EVENTS #/##########################/#

func _on_step(delta: float) -> bool:
	var arm := position - center
	
	if arm.is_zero_approx():
		arm = Vector2.RIGHT
	
	arm = radius * arm.normalized()
	
	position = center + arm.rotated(angular_velocity * delta)
	
	return false

#/##########################/# END #/##########################/#
