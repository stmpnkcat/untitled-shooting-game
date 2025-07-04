extends Node2D


@onready var hitbox_component: HitboxComponent = $HitboxComponent

var damage: float
var knockback_force: float
var movement_speed: float
var max_range: float
var travelled_distance: float = 0


func _physics_process(delta: float) -> void:
	
	var direction : Vector2 = Vector2.RIGHT.rotated(rotation)
	
	position += direction * movement_speed * delta
	travelled_distance += movement_speed * delta
	
	if travelled_distance > max_range:
		queue_free()


func _on_hitbox_component_hit(hurtbox: HurtboxComponent) -> void:
	queue_free()
