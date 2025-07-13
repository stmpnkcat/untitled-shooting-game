extends CharacterBody2D


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


func _physics_process(delta: float) -> void:
	if game.player:
		var player_position: Vector2 = game.player.global_position
		var direction: Vector2 = global_position.direction_to(player_position).normalized()
		physics_component.base_velocity = direction * movement_speed


func _on_death() -> void:
	queue_free()
