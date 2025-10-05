extends Label

@export var state : GlobalState

func _process(delta: float) -> void:
	if state.model_object is not Node:
		text = "Model is empty"
	else:
		if not state.model_animations_folder:
			text = "Select animation output path first"
		else:
			if state.model_object.has_node("AnimationPlayer") == false:
				text = "No animation player founded"
			else:
				text = "Animation: %s" % [state.model_object.get_node("AnimationPlayer").current_animation]
	
	return
