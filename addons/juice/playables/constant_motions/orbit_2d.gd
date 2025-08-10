@tool
class_name Orbit2D
extends Playable2D
## This node orbits around a specified center without rotation at the specified
## angular velocity indefinitely or until stopped.

#/##########################/# EXPORTS #/##########################/#

## The center of the orbit in pixels.
@export var center := Vector2.ZERO

## The radius of the orbit in pixels.
@export var radius := 64.0

## The angular velocity in degrees per second.
@export var angular_velocity := 45.0

#/##########################/# EVENTS #/##########################/#

func _on_step(delta: float) -> bool:
	var arm := position - center
	
	if arm.is_zero_approx():
		arm = Vector2.RIGHT
	
	arm = radius * arm.normalized()
	
	position = center + arm.rotated(deg_to_rad(angular_velocity) * delta)
	
	return false

#/##########################/# END #/##########################/#
