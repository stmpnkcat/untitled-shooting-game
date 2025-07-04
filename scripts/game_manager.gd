extends Node

@export var Player: PackedScene
@export var Enemy: PackedScene
@export var Exp: PackedScene

const PLAYER_SPAWN_POSITION : Vector2 = Vector2(0, 0)


func _ready() -> void:
	game.game_manager = self


func spawn_enemy(enemy_position: Vector2) -> void:
	var new_enemy : Node2D = Enemy.instantiate()
	%Entities.add_child(new_enemy)
	new_enemy.position = enemy_position


func spawn_exp(position: Vector2, exp_amount: float) -> void:
	var new_exp : Node2D = Exp.instantiate()
	%Collectibles.get_node("Exp").call_deferred("add_child", new_exp)
	new_exp.position = position
	new_exp.exp_amount = exp_amount


func _on_enemy_spawn_timer_timeout() -> void:
	if game.player:
		var spawn_path: PathFollow2D = game.player.get_node("EnemySpawnPath/PathFollow2D")
		spawn_path.progress_ratio = game.rng.randf()
		spawn_enemy(spawn_path.global_position)
