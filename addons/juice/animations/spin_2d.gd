@tool
class_name Spin2D
extends Node2D
## This node rotates at the specified angular velocity indefinitely or until
## stopped.

#/##########################/# EXPORTS #/##########################/#

## If true, the animation plays until it's stopped.
@export var playing := false : set = set_playing

## The angular velocity in radians per second.
@export var angular_velocity := 0.25 * PI

## The angular velocity in degrees per second.
@export var angular_velocity_degrees := 45.0 : set = set_angular_velocity_degrees

#/##########################/# SETGET #/##########################/#

func set_playing(new_playing: bool) -> void:
	playing = new_playing
	set_process(playing)


func set_angular_velocity_degrees(new_angular_velocity_degrees: float) -> void:
	angular_velocity_degrees = new_angular_velocity_degrees
	angular_velocity = deg_to_rad(angular_velocity_degrees)

#/##########################/# INIT #/##########################/#

func _ready() -> void:
	set_process(playing)

#/##########################/# METHODS #/##########################/#

func play() -> void:
	playing = true


func stop() -> void:
	playing = false

#/##########################/# GODOT #/##########################/#

func _process(delta: float) -> void:
	rotation += angular_velocity * delta

#/##########################/# END #/##########################/#
