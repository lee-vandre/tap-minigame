extends SubViewportContainer


var val : float = 0.5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	val += 0.02
	if val > 1.0:
		val = 0.5
	material.set_shader_parameter("sample_radius", val)
