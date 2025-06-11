class_name HurtboxComponent
extends Area2D

@onready
var health_component: HealthComponent = get_parent().get_node("HealthComponent")
@export
var sprite: Node2D

var is_damageable: bool = true

signal hurt(hitbox: HitboxComponent)

func _ready() -> void:
	connect("area_entered", Callable(self, "_on_area_entered"))


func _process(delta: float) -> void:
	for HitboxComponent in get_overlapping_areas():
		_on_area_entered(HitboxComponent)


func _on_area_entered(hitbox: HitboxComponent) -> void:
	hurt.emit(hitbox)
	health_component.take_damage(hitbox.damage)
	flash_sprite()


func flash_sprite():
	var mat: ShaderMaterial = sprite.material
	if mat:
		print("flashing")
		mat.set_shader_parameter("enabled", true)
		await get_tree().create_timer(0.1).timeout
		mat.set_shader_parameter("enabled", false)
