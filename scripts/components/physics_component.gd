extends Node2D
class_name PhysicsComponent


var velocity: Vector2 = Vector2.ZERO
var base_velocity: Vector2 = Vector2.ZERO
var ext_velocity: Vector2 = Vector2.ZERO


func _physics_process(delta: float) -> void:
	if ext_velocity:
		velocity = ext_velocity
	else:
		velocity = base_velocity
	ext_velocity = ext_velocity.move_toward(Vector2.ZERO, 1000 * delta)


func add_impulse(impulse: Vector2) -> void:
	ext_velocity += impulse
