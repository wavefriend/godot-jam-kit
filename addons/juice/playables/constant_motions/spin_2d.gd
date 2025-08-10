@tool
class_name Spin2D
extends Playable2D
## This node rotates at the specified angular velocity indefinitely or until
## stopped.

#/##########################/# EXPORTS #/##########################/#

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
	rotation += angular_velocity * delta
	return false

#/##########################/# END #/##########################/#
