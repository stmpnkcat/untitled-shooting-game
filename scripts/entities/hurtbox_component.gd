class_name HurtboxComponent
extends Area2D

@export
var health_component: HealthComponent

var is_damageable : bool = true

signal hurt(hitbox: HitboxComponent)

func _ready() -> void:
	connect("area_entered", Callable(self, "_on_area_entered"))

func _process(delta: float) -> void:
	for HitboxComponent in get_overlapping_areas():
		_on_area_entered(HitboxComponent)

func _on_area_entered(hitbox: HitboxComponent) -> void:
	hurt.emit(hitbox)
	health_component.take_damage(hitbox.damage)
