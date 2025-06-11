extends CharacterBody2D

@export
var speed : float
@onready
var health_component: HealthComponent = $HealthComponent


func _ready() -> void:
	connect("died", Callable(self, "_on_death"))


func _process(delta: float) -> void:
	if game.player:
		velocity = global_position.direction_to(game.player.position).normalized() * speed


func _physics_process(delta: float) -> void:
	move_and_slide()


func _on_death() -> void:
	print('dead')
	queue_free()
