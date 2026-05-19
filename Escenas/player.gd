extends RigidBody3D
@onready var spring_arm_3d: SpringArm3D = $SpringArm3D
var speed = 0.01

func _ready() -> void:
	spring_arm_3d.top_level = true

func _process(delta: float) -> void:
	pass
func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
	var inputDirection = Vector3(
		Input.get_axis("left","right"),
		0,
		Input.get_axis("up","down")
	)
	inputDirection = inputDirection.rotated(Vector3.UP, spring_arm_3d.rotation.y).normalized() * speed
	
	apply_central_impulse(Vector3(inputDirection.x, 0, inputDirection.z))
