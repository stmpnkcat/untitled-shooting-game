extends CharacterBody2D

@export
var speed : float
var is_damageable : bool = true
	
func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	direction.normalized()
	velocity = direction * 600
	move_and_slide()
	
	if velocity.length() > 0:
		%AnimatedSprite2D.play("walk")
	else:
		%AnimatedSprite2D.play("idle")
