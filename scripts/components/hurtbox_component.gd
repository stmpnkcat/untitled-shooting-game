class_name HurtboxComponent
extends Area2D


@onready
var parent: Node2D = get_parent()

signal hurt(hitbox_component: HitboxComponent)


func recieve_hit(hitbox_component: HitboxComponent) -> void:
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


func _process(delta: float) -> void:
	var overlapping_bodies: Array = get_overlapping_bodies()
	if len(overlapping_bodies) >= 1:
		var body: Node2D = overlapping_bodies.front()
		print(body.get_children())
		var hitbox_component: HitboxComponent = body.get_node("HitboxComponent")
		var health_component: HealthComponent = parent.get_node_or_null("HealthComponent")
		if health_component and health_component.take_damage(hitbox_component.damage):
			emit_signal("hurt", hitbox_component)
			flash_sprite()
			
		var physics_component: PhysicsComponent = parent.get_node_or_null("PhysicsComponent")
		if physics_component:
			var direction: Vector2 = (parent.global_position - hitbox_component.global_position).normalized()
			var knockback: Vector2 = direction * hitbox_component.knockback_force
			physics_component.add_impulse(knockback)
