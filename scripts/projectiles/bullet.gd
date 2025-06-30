extends Node2D

var damage : float
var speed : float
var range : float

var travelled_distance : float = 0

@onready
var hitbox_component = $HitboxComponent

func _ready() -> void:
	hitbox_component.damage = damage


func _physics_process(delta: float) -> void:
	
	var direction = Vector2.RIGHT.rotated(rotation)
	
	position += direction * speed * delta
	travelled_distance += speed * delta
	
	if travelled_distance > range:
		queue_free()


func _on_hitbox_component_hit(hurtbox: HurtboxComponent) -> void:
	queue_free()
