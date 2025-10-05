extends Button

@export var container : SubViewportContainer
@export var width_edit : SpinBox
@export var height_edit : SpinBox

func _pressed() -> void:
	# TODO: Choose image Path with FileDialog
	
	var fs := FileDialog.new()
	fs.access = FileDialog.ACCESS_FILESYSTEM
	fs.file_mode = FileDialog.FILE_MODE_SAVE_FILE
	fs.add_filter("*.png", "Images")
	fs.use_native_dialog = true
	fs.close_requested.connect(fs.queue_free)
	fs.canceled.connect(fs.queue_free)
	fs.file_selected.connect(func(filename : String) -> void:
		var texture := container.get_viewport().get_texture()
		var data := texture.get_image()
		data = data.get_region(Rect2i(0, 0, int(width_edit.value), int(height_edit.value)))
		data.save_png("%s" % [filename])
		
		fs.queue_free())
	
	add_child(fs)
	
	fs.initial_position = Window.WINDOW_INITIAL_POSITION_CENTER_PRIMARY_SCREEN
	fs.show()
