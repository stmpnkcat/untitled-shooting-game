extends CharacterBody2D

@export
var speed: float
var is_damageable: bool = true


func _ready() -> void:
	game.player = self


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	direction.normalized()
	velocity = direction * speed
	move_and_slide()

	if velocity.length() > 0:
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.play("idle")
	

func _on_death() -> void:
	game.player = null
	game.switch_scene("res://scenes/main_menu.tscn")
	queue_free()
