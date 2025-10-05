extends SpinBox

@export var camera : Camera3D

func _on_value_changed(new_value: float) -> void:
	camera.size = new_value

func _ready() -> void:
	value_changed.connect(_on_value_changed)
