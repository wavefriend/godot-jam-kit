@tool
class_name Playable2D
extends Node2D
## This is the base class for all nodes that perform an action with a start and
## end.

#/##########################/# SIGNALS #/##########################/#

## Emitted once the playable has reached its end.
signal finished()

#/##########################/# EXPORTS #/##########################/#

## If true, the playable plays until it's stopped or finishes.
@export var playing := false : set = set_playing

#/##########################/# SETGET #/##########################/#

func set_playing(new_playing: bool) -> void:
	if not playing and new_playing:
		_on_play()
	elif playing and not new_playing:
		_on_stop()
	
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

#/##########################/# EVENTS #/##########################/#

## virtual
## Called when "playing" is set to true from false or play() is called.
func _on_play() -> void:
	pass


## virtual
## Called when "playing" is set to false from true or stop() is called or the
## playable finishes.
func _on_stop() -> void:
	pass


## virtual
## Called every process frame. Return true if the playable has finished.
func _on_step(_delta: float) -> bool:
	return false

#/##########################/# GODOT #/##########################/#

func _process(delta: float) -> void:
	if _on_step(delta):
		stop()
		finished.emit()

#/##########################/# END #/##########################/#
