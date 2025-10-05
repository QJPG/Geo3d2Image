extends SpinBox

enum OffsetMode {
	X, Y
}

@export var mode : OffsetMode
@export var camera : Camera3D

func _on_value_changed(new_value: float) -> void:
	match mode:
		OffsetMode.X:
			camera.h_offset = new_value
		
		OffsetMode.Y:
			camera.v_offset = new_value

func _ready() -> void:
	value_changed.connect(_on_value_changed)
