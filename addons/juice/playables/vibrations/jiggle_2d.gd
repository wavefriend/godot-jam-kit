@tool
class_name Jiggle2D
extends Playable2D
## This node jiggles (oscillates scale) with the specified parameters for the
## specified duration.

#/##########################/# EXPORTS #/##########################/#

## The duration of the animation in seconds.
@export_range(0.0, 128.0) var duration := 1.0

## The number of oscillations per second.
@export_range(-128.0, 128.0) var frequency := 8.0

## The amplitude of oscillations in scale factor units.
@export_range(-16.0, 16.0) var amplitude := 0.1

## The direction of oscillation for positive amplitude.
@export var direction := Vector2.RIGHT
# TODO Add direction randomization

#/##########################/# VARIABLES #/##########################/#

var time := 0.0

var offset := Vector2.ONE

#/##########################/# EVENTS #/##########################/#

## override
func _on_play() -> void:
	time = 0.0
	offset = scale


## override
func _on_stop() -> void:
	playing = false
	time = 0.0
	scale = offset
	offset = Vector2.ONE


## override
func _on_step(delta: float) -> bool:
	time += delta
	scale = offset + amplitude * sin(2.0 * PI * frequency * time) * direction
	return time >= duration

#/##########################/# END #/##########################/#
