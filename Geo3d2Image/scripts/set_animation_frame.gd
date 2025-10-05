extends SpinBox

@export var state : GlobalState

func _on_value_changed(new_value: float) -> void:
	if state.model_object is Node:
		var animator : AnimationPlayer = state.model_object.get_node_or_null("AnimationPlayer")
		
		if animator:
			animator.seek(new_value, true)

func _ready() -> void:
	value_changed.connect(_on_value_changed)

func _process(delta: float) -> void:
	if state.model_object is Node:
		var animator : AnimationPlayer = state.model_object.get_node_or_null("AnimationPlayer")
		
		if animator and animator.current_animation:
			value = animator.current_animation_position
