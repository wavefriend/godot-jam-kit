@tool
class_name Shake2D
extends Node2D
# TODO Add direction randomization

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

## The amplitude of oscillations in pixels.
@export_range(-128.0, 128.0) var amplitude := 8.0

## The direction of oscillation for positive amplitude.
@export var direction := Vector2.RIGHT

#/##########################/# VARIABLES #/##########################/#

var time := 0.0

var offset := Vector2.ZERO

#/##########################/# SETGET #/##########################/#

func set_playing(new_playing: bool) -> void:
	if not playing and new_playing:
		time = 0.0
		offset = position
	elif playing and not new_playing:
		time = 0.0
		position = offset
		offset = Vector2.ZERO
	
	playing = new_playing
	set_process(new_playing)

#/##########################/# INIT #/##########################/#

func _ready() -> void:
	set_process(false)

#/##########################/# METHODS #/##########################/#

func play() -> void:
	playing = false
	playing = true


func stop() -> void:
	playing = false

#/##########################/# GODOT #/##########################/#

func _process(delta: float) -> void:
	time += delta
	
	position = offset + amplitude * sin(2.0 * PI * frequency * time) * direction
	
	if time >= duration:
		stop()
		finished.emit()

#/##########################/# END #/##########################/#
