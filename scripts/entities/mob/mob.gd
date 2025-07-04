extends CharacterBody2D


@export
var speed : float
@export
var exp_amount: float

@onready
var health_component: HealthComponent = $HealthComponent
@onready
var hitbox_component: HitboxComponent = $HitboxComponent
@onready
var hurtbox_component: HurtboxComponent = $HurtboxComponent
@onready
var physics_component: PhysicsComponent = $PhysicsComponent


func _process(delta: float) -> void:
	if game.player:
		var player_position: Vector2 = game.player.global_position
		var direction: Vector2 = global_position.direction_to(player_position).normalized()
		physics_component.base_velocity = direction * speed
	velocity = physics_component.velocity


func _physics_process(delta: float) -> void:
	move_and_slide()


func _on_death() -> void:
	queue_free()
