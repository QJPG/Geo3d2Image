extends Button

@export var state : GlobalState

func _pressed() -> void:
	var fs := FileDialog.new()
	fs.access = FileDialog.ACCESS_FILESYSTEM
	fs.file_mode = FileDialog.FILE_MODE_OPEN_DIR
	fs.use_native_dialog = true
	fs.close_requested.connect(fs.queue_free)
	fs.canceled.connect(fs.queue_free)
	fs.dir_selected.connect(func(dir : String) -> void:
		state.model_animations_folder = dir
		fs.queue_free())
	
	add_child(fs)
	
	fs.initial_position = Window.WINDOW_INITIAL_POSITION_CENTER_PRIMARY_SCREEN
	fs.show()
