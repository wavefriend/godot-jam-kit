@tool
class_name Waggle2D
extends Playable2D
## This node waggles (oscillates skew) with the specified parameters for the
## specified duration.

#/##########################/# EXPORTS #/##########################/#

## The duration of the animation in seconds.
@export var duration := 1.0

## The number of oscillations per second.
@export var frequency := 8.0

## The amplitude of oscillations in degrees.
@export var amplitude := 10.0

#/##########################/# VARIABLES #/##########################/#

var time := 0.0

var offset := 0.0

#/##########################/# EVENTS #/##########################/#

func _on_play() -> void:
	time = 0.0
	offset = skew


func _on_stop() -> void:
	time = 0.0
	skew = offset
	offset = 0.0


func _on_step(delta: float) -> bool:
	time += delta
	skew = offset + deg_to_rad(amplitude) * sin(2.0 * PI * frequency * time)
	return time >= duration

#/##########################/# END #/##########################/#
