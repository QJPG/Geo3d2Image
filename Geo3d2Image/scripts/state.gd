extends Node

class_name GlobalState

var model_object : Variant : set = _set_model_object
var model_animations_submenu : PopupMenu = PopupMenu.new()
var model_animations_folder : String

@export var tool_window : Window

func _set_model_object(_object : Variant) -> void:
	model_animations_submenu.clear(true)
	
	if _object is Node:
		var animator : AnimationPlayer = _object.get_node_or_null("AnimationPlayer")
		
		if animator:
			for i in range(animator.get_animation_list().size()):
				model_animations_submenu.add_item(animator.get_animation_list()[i])
	
	model_object = _object

func _ready() -> void:
	tool_window.close_requested.connect(func() -> void:
		get_tree().quit())
	
