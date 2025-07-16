class_name HitboxComponent
extends Area2D


signal hit(hurtbox: HurtboxComponent)

@onready var parent: Node2D = get_parent()

var damage: float
var knockback_force: float
var has_hit: bool = false
var original_position: Vector2


func _ready() -> void:
	damage = parent.damage
	knockback_force = parent.knockback_force


func _on_area_entered(hurtbox_component: HurtboxComponent) -> void:
	if not has_hit:
		hit.emit(hurtbox_component)
		if not original_position:
			original_position = global_position
		hurtbox_component.recieve_hit(self)
		has_hit = true
