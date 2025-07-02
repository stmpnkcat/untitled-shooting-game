extends Node2D

var damage : float
var speed : float
var max_range : float
var travelled_distance : float = 0


func _ready() -> void:
	$HitboxComponent.damage = damage


func _physics_process(delta: float) -> void:
	
	var direction : Vector2 = Vector2.RIGHT.rotated(rotation)
	
	position += direction * speed * delta
	travelled_distance += speed * delta
	
	if travelled_distance > max_range:
		queue_free()


func _on_hitbox_component_hit(hurtbox: HurtboxComponent) -> void:
	queue_free()
