@tool
class_name Shake2D
extends Playable2D
## This node shakes (oscillates position) with the specified parameters for the
## specified duration.

#/##########################/# EXPORTS #/##########################/#

## The duration of the animation in seconds.
@export_range(0.0, 128.0) var duration := 1.0

## The number of oscillations per second.
@export_range(-128.0, 128.0) var frequency := 8.0

## The amplitude of oscillations in pixels.
@export_range(-128.0, 128.0) var amplitude := 8.0

## The direction of oscillation for positive amplitude.
@export var direction := Vector2.RIGHT
# TODO Add direction randomization

#/##########################/# VARIABLES #/##########################/#

var time := 0.0

var offset := Vector2.ZERO

#/##########################/# EVENTS #/##########################/#

func _on_play() -> void:
	time = 0.0
	offset = position


func _on_stop() -> void:
	time = 0.0
	position = offset
	offset = Vector2.ZERO


func _on_step(delta: float) -> bool:
	time += delta
	position = offset + amplitude * sin(2.0 * PI * frequency * time) * direction
	return time >= duration

#/##########################/# END #/##########################/#
