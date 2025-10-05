extends Button

@export var root : Node3D
@export var state : GlobalState

func _pressed() -> void:
	for child in root.get_children():
		root.queue_free()
	
	var fs := FileDialog.new()
	fs.access = FileDialog.ACCESS_FILESYSTEM
	fs.file_mode = FileDialog.FILE_MODE_OPEN_FILE
	fs.use_native_dialog = true
	fs.close_requested.connect(fs.queue_free)
	fs.canceled.connect(fs.queue_free)
	fs.file_selected.connect(func(filename : String) -> void:
		var data = load(filename)
		
		if data is PackedScene:
			data = data.instantiate()
			state.model_object = data
			root.add_child(state.model_object)
		else:
			OS.alert("Error on load GLTF model")
		
		fs.queue_free())
	
	add_child(fs)
	
	fs.initial_position = Window.WINDOW_INITIAL_POSITION_CENTER_PRIMARY_SCREEN
	fs.show()
