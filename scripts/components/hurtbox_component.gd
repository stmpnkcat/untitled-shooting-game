class_name HurtboxComponent
extends Area2D


@onready
var parent: Node2D = get_parent()

signal hurt(hitbox: HitboxComponent)


func _process(delta: float) -> void:
	for hitbox: HitboxComponent in get_overlapping_areas():
		_on_area_entered(hitbox)
 

func _on_area_entered(hitbox_component: HitboxComponent) -> void:
	var health_component: HealthComponent = parent.get_node_or_null("HealthComponent")
	if health_component and health_component.take_damage(hitbox_component.damage):
		hurt.emit(hitbox_component)
		flash_sprite()
		
	var physics_component: PhysicsComponent = parent.get_node_or_null("PhysicsComponent")
	if physics_component:
		var direction: Vector2 = (parent.global_position - hitbox_component.global_position).normalized()
		var knockback: Vector2 = direction * hitbox_component.knockback_force
		physics_component.add_impulse(knockback)


func flash_sprite() -> void:
	var sprite: AnimatedSprite2D = parent.get_node("AnimatedSprite2D")
	var mat: ShaderMaterial = sprite.material
	if mat:
		mat.set_shader_parameter("enabled", true)
		await get_tree().create_timer(0.1).timeout
		mat.set_shader_parameter("enabled", false)
