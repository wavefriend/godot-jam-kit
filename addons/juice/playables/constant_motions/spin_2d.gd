@tool
class_name Spin2D
extends Playable2D
## This node rotates at the specified angular velocity indefinitely or until
## stopped.

#/##########################/# EXPORTS #/##########################/#

## The angular velocity in degrees per second.
@export var angular_velocity := 45.0

#/##########################/# EVENTS #/##########################/#

func _on_step(delta: float) -> bool:
	rotation_degrees += angular_velocity * delta
	return false

#/##########################/# END #/##########################/#
