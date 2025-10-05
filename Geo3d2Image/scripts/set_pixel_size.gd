extends SpinBox

func _on_value_changed(new_value: float) -> void:
	RenderingServer.global_shader_parameter_set("PIXEL_SIZE", new_value)

func _ready() -> void:
	value_changed.connect(_on_value_changed)
