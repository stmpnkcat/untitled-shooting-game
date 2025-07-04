class_name HitboxComponent
extends Area2D


@export
var damage: float
@export
var knockback_force: float
@export
var is_single_target: bool


signal hit(hurtbox: HurtboxComponent)


func _on_area_entered(hurtbox: HurtboxComponent) -> void:
	hit.emit(hurtbox)
	if is_single_target: 
		queue_free()
