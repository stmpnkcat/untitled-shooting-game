class_name HitboxComponent
extends Area2D

@export
var damage: float

signal hit(hurtbox: HurtboxComponent)


func _on_area_entered(hurtbox: HurtboxComponent) -> void:
	hit.emit(hurtbox)
