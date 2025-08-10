@tool
class_name ParallelPlayer2D
extends Playable2D
## This node plays all the playable children simultaneously and finishes once
## they've all finished.

#/##########################/# EVENTS #/##########################/#

## override
func _on_play() -> void:
	for child in get_children():
		if child.has_method("play"):
			child.play()


## override
func _on_stop() -> void:
	for child in get_children():
		if child.has_method("stop"):
			child.stop()


## override
func _on_step(delta: float) -> bool:
	for child in get_children():
		if child.playing:
			return false
	return true

#/##########################/# END #/##########################/#
