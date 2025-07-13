extends RigidBody2D


@export var movement_speed: float
@export var exp_amount: float

@onready var health_component: HealthComponent = $HealthComponent
@export var max_health: float
@export var is_damageable: bool
@export var iframes_duration: float

@onready var hitbox_component: HitboxComponent = $HitboxComponent
@export var damage: float
@export var knockback_force: float

@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent

@onready var physics_component: PhysicsComponent = $PhysicsComponent


func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if game.player:
		var player_position: Vector2 = game.player.global_position
		var direction: Vector2 = global_position.direction_to(player_position).normalized()
		physics_component.set_base_velocity(direction * movement_speed)
		state.linear_velocity = physics_component.velocity
	


func _on_death() -> void:
	queue_free()
