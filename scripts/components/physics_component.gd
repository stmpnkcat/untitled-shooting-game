extends Node2D
class_name PhysicsComponent


@onready var parent: Node2D = get_parent()

var velocity: Vector2 = Vector2.ZERO
var impulse_velocity: Vector2 = Vector2.ZERO
var base_velocity: Vector2 = Vector2.ZERO


func _physics_process(delta: float) -> void:
	velocity = base_velocity + impulse_velocity
	impulse_velocity = impulse_velocity.move_toward(Vector2.ZERO, delta * 1000)


func set_base_velocity(new_base_velocity) -> void:
	base_velocity = new_base_velocity


func apply_impulse(impulse_force: Vector2) -> void:
	impulse_velocity += impulse_force
