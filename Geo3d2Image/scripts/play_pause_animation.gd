extends Button

@export var state : GlobalState
@export var animation_name : LineEdit

func _ready() -> void:
	return

func _pressed() -> void:
	if state.model_object is Node:
		var animator : AnimationPlayer = state.model_object.get_node_or_null("AnimationPlayer")
		
		if animator:
			if animator.is_playing():
				if animator.current_animation:
					animator.pause()
			else:
				if animator.has_animation(animation_name.text):
					animator.play(animation_name.text)
		
