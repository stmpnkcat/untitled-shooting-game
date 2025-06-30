extends CharacterBody2D

@export
var speed : float
@export
var exp: float
@onready
var health_component: HealthComponent = $HealthComponent


func _process(delta: float) -> void:
	if game.player:
		velocity = global_position.direction_to(game.player.position).normalized() * speed


func _physics_process(delta: float) -> void:
	move_and_slide()


func _on_death() -> void:
	get_node(game.GAME_MANAGER).spawn_exp(global_position, exp)
	queue_free()
