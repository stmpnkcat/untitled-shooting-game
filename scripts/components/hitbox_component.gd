class_name HitboxComponent
extends Area2D


@export
var damage: float
@export
var knockback_force: float

@onready
var parent: Node2D = get_parent()

var has_hit: bool = false

signal hit(hurtbox: HurtboxComponent)


func _on_area_entered(hurtbox_component: HurtboxComponent) -> void:
	if not has_hit:
		hit.emit(hurtbox_component)
		hurtbox_component.recieve_hit(self)
		has_hit = true
