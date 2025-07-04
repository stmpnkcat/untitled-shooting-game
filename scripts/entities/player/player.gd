extends CharacterBody2D


@export var movement_speed: float

@onready var health_component: HealthComponent = $HealthComponent
@export var max_health: float
@export var is_damageable: bool
@export var iframes_duration: float

@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent

@onready var physics_component: PhysicsComponent = $PhysicsComponent


func _ready() -> void:
	game.player = self


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	direction.normalized()
	velocity = direction * movement_speed
	move_and_slide()

	if velocity.length() > 0:
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.play("idle")
	

func _on_death() -> void:
	game.player = null
	game.switch_scene("res://scenes/UI/main_menu.tscn")
	queue_free()
