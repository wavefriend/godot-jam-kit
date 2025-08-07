@tool
class_name Waggle2D
extends Node2D
## This node waggles (oscillates skew) with the specified amplitude and
## specified frequency for the specified duration when told to play.

#/##########################/# SIGNALS #/##########################/#

## Emitted once the animation has reached the end of the duration.
signal finished()

#/##########################/# EXPORTS #/##########################/#

## If true, the animation plays until it's stopped or finishes.
@export var playing := false : set = set_playing

## The duration of the animation in seconds.
@export_range(0.0, 128.0) var duration := 1.0

## The number of oscillations per second.
@export_range(-128.0, 128.0) var frequency := 8.0

## The amplitude of oscillations in radians.
@export_range(-16.0, 16.0) var amplitude := 0.1

#/##########################/# VARIABLES #/##########################/#

var time := 0.0

var offset := 0.0

#/##########################/# SETGET #/##########################/#

func set_playing(new_playing: bool) -> void:
	if not playing and new_playing:
		time = 0.0
		offset = skew
	elif playing and not new_playing:
		time = 0.0
		skew = offset
		offset = 0.0
	
	playing = new_playing
	set_process(new_playing)

#/##########################/# INIT #/##########################/#

func _ready() -> void:
	set_process(playing)

#/##########################/# METHODS #/##########################/#

func play() -> void:
	playing = false
	playing = true


func stop() -> void:
	playing = false

#/##########################/# GODOT #/##########################/#

func _process(delta: float) -> void:
	time += delta
	
	skew = offset + amplitude * sin(2.0 * PI * frequency * time)
	
	if time >= duration:
		stop()
		finished.emit()

#/##########################/# END #/##########################/#
