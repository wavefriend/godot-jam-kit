@tool
class_name SeriesPlayer2D
extends Playable2D
## This node plays the playable children in order and finishes once the last one
## has finished.

#/##########################/# VARIABLES #/##########################/#

var current_playable: Node = null

#/##########################/# METHODS #/##########################/#

func _next_playable() -> void:
	var playable_idx := current_playable.get_index() if is_instance_valid(current_playable) else -1
	
	while playable_idx < get_child_count() - 1:
		playable_idx += 1
		
		if get_child(playable_idx).has_method("play") and get_child(playable_idx).has_method("stop"):
			current_playable = get_child(playable_idx)
			current_playable.play()
			return
	
	current_playable = null

#/##########################/# EVENTS #/##########################/#

## override
func _on_play() -> void:
	current_playable = null
	_next_playable()


## override
func _on_stop() -> void:
	if is_instance_valid(current_playable):
		current_playable.stop()
		current_playable = null


## override
func _on_step(delta: float) -> bool:
	if not is_instance_valid(current_playable):
		return true
	
	if not current_playable.playing:
		_next_playable()
	
	if not is_instance_valid(current_playable):
		return true
	
	return false

#/##########################/# END #/##########################/#
