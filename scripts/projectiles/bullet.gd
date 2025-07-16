extends RigidBody2D


@onready var hitbox_component: HitboxComponent = $HitboxComponent
@onready var physics_component: PhysicsComponent = $PhysicsComponent

var damage: float
var knockback_force: float
var movement_speed: float
var max_range: float
var travelled_distance: float = 0


func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	var direction: Vector2 = Vector2.RIGHT.rotated(rotation).normalized()
	physics_component.set_base_velocity(direction * movement_speed)
	travelled_distance += movement_speed * state.step
	state.linear_velocity = physics_component.velocity
	
	if travelled_distance > max_range:
		queue_free()


func _on_hitbox_component_hit(hurtbox: HurtboxComponent) -> void:
	queue_free()
