extends Node


@export var Player: PackedScene
@export var Enemy: PackedScene
@export var Exp: PackedScene
@export var DamageNumber: PackedScene

const PLAYER_SPAWN_POSITION : Vector2 = Vector2(0, 0)


func _ready() -> void:
	game.game_manager = self


func spawn_damage_number(position: Vector2, damage_number: float) -> void:
	var new_damage_number: Control = DamageNumber.instantiate()
	new_damage_number.position = position
	new_damage_number.number = damage_number
	%Effects.add_child(new_damage_number)


func spawn_enemy(enemy_position: Vector2) -> void:
	var new_enemy: RigidBody2D = Enemy.instantiate()
	new_enemy.position = enemy_position
	%Entities.add_child(new_enemy)


func spawn_exp(position: Vector2, exp_amount: float) -> void:
	var new_exp: Node2D = Exp.instantiate()
	new_exp.position = position
	new_exp.exp_amount = exp_amount
	%Collectibles.get_node("Exp").call_deferred("add_child", new_exp)


func _on_enemy_spawn_timer_timeout() -> void:
	if game.player:
		var spawn_path: PathFollow2D = game.player.get_node("EnemySpawnPath/PathFollow2D")
		spawn_path.progress_ratio = game.rng.randf()
		spawn_enemy(spawn_path.global_position)
