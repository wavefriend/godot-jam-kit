@tool
class_name Wobble2D
extends Playable2D
## This node wobbles (oscillates rotation) with the specified parameters for the
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
	offset = rotation


func _on_stop() -> void:
	time = 0.0
	rotation = offset
	offset = 0.0


func _on_step(delta: float) -> bool:
	time += delta
	rotation = offset + deg_to_rad(amplitude) * sin(2.0 * PI * frequency * time)
	return time >= duration

#/##########################/# END #/##########################/#
