extends CharacterBody2D

@export
var speed : float
@export
var exp_amount: float


func _process(delta: float) -> void:
	if game.player:
		velocity = global_position.direction_to(game.player.position).normalized() * speed


func _physics_process(delta: float) -> void:
	move_and_slide()


func _on_death() -> void:
	queue_free()
