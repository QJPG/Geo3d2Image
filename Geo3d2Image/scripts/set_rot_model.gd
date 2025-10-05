extends SpinBox

enum RotationMode {
	X, Y, Z
}

@export var mode : RotationMode
@export var root : Node3D

func _on_value_changed(new_value: float) -> void:
	print(new_value)
	match mode:
		RotationMode.X:
			root.rotation_degrees.x = new_value
		
		RotationMode.Y:
			root.rotation_degrees.y = new_value
		
		RotationMode.Z:
			root.rotation_degrees.z = new_value

func _ready() -> void:
	value_changed.connect(_on_value_changed)
