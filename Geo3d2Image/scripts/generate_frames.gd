extends Button

@export var state : GlobalState
@export var interval_edit : SpinBox
@export var animation_name : LineEdit

@export var container : SubViewportContainer
@export var width_edit : SpinBox
@export var height_edit : SpinBox

var target : AnimationPlayer
var last_frames : float = 0.0
var frame : int

func save_screenshot() -> void:
	var texture := container.get_viewport().get_texture()
	var data := texture.get_image()
	data = data.get_region(Rect2i(0, 0, int(width_edit.value), int(height_edit.value)))
	data.save_png("%s/frame_%s.png" % [state.model_animations_folder, frame])

func _pressed() -> void:
	if state.model_object is Node and state.model_animations_folder:
		var animator : AnimationPlayer = state.model_object.get_node_or_null("AnimationPlayer")
		
		if animator and animator.is_playing() == false and animator.has_animation(animation_name.text) and target == null:
			animator.stop()
			animator.play(animation_name.text)
			last_frames = 0.0
			target = animator
			frame = 0
			print("Started")

func _process(delta: float) -> void:
	if target:
		if not target.current_animation:
			target = null
			last_frames = 0.0
			frame = 0
			print("Finished")
			return
	
		var current_interval : float = target.current_animation_position
		
		if last_frames >= interval_edit.value:
			save_screenshot()
			last_frames = 0.0
			frame += 1
			print("Frame %s" % frame)
		
		last_frames += current_interval
		
	return
