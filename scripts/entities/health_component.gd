class_name HealthComponent
extends Node2D

signal died

@export
var max_health: float:
	set (value):
		max_health = value
		if current_health > max_health:
			current_health = max_health
var current_health: float:
	set (value):
		current_health = value
		if current_health > max_health:
			current_health = max_health
		if current_health <= 0 and not is_dead:
			just_died()
@export
var is_damageable: bool = true
@export
var i_frames_duration: float

var is_invincible: bool = false
var is_dead: bool = false
var parent: Node2D


func _ready() -> void:
	current_health = max_health
	parent = get_parent()


func take_damage(damage: float) -> bool:
	if is_damageable:
		if not is_invincible:
			current_health -= damage
			invincibility_timer()
			return true
	return false


func invincibility_timer() -> void:
	is_invincible = true
	await get_tree().create_timer(i_frames_duration).timeout
	is_invincible = false


func heal(heal_amount: float) -> void:
	current_health += heal_amount


func set_health(new_health: float) -> void:
	current_health = new_health


func set_max_health(new_max_health: float) -> void:
	max_health = new_max_health


func reset_health() -> void:
	current_health = max_health


func just_died() -> void:
	is_dead = true
	emit_signal("died")
	if "exp_amount" in parent:
		get_node(game.GAME_MANAGER).spawn_exp(parent.global_position, parent.exp_amount)
