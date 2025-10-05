extends SpinBox

enum SizeMode {
	X, Y
}

@export var mode : SizeMode
@export var viewport : SubViewport

func _on_value_changed(new_value: float) -> void:
	match mode:
		SizeMode.X:
			viewport.size.x = int(new_value)
		
		SizeMode.Y:
			viewport.size.y = int(new_value)

func _ready() -> void:
	value_changed.connect(_on_value_changed)
