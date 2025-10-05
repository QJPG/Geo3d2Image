extends LineEdit

@export var state : GlobalState

func _ready() -> void:
	text_submitted.connect(func(animation_name : String) -> void:
		if state.model_object is Node:
			var animator : AnimationPlayer = state.model_object.get_node_or_null("AnimationPlayer")
			
			if animator:
				if animator.has_animation(animation_name):
					animator.current_animation = animation_name
				else:
					OS.alert("Animation '%s' not exists!" % [animation_name]))
		
	get_menu().add_submenu_node_item("Animations", state.model_animations_submenu)
	
	state.model_animations_submenu.index_pressed.connect(func(index: int) -> void:
		text = state.model_animations_submenu.get_item_text(index)
		text_submitted.emit(text))
