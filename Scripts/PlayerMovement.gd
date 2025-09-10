extends Node3D

@export var speed: float = 200.0
@export var GrassInstances: MultiMeshInstance3D

func _process(delta: float) -> void:
	var direction = Vector3.ZERO
	
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.z += 1
	if Input.is_action_pressed("ui_up"):
		direction.z -= 1

	if direction != Vector3.ZERO:
		direction = direction.normalized()
	
	position += direction * speed * delta
	
	# grass interact code
	GrassInstances.material_override.set_shader_parameter("PlayerPosition", position)
