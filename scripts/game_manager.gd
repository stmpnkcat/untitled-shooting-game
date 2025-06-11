extends Node

@export var Player: PackedScene
@export var Enemy: PackedScene

const PLAYER_SPAWN_POSITION = Vector2(0, 0)

func _ready() -> void:
	connect("timeout", Callable(self, "on_timer_timeout"))


func spawn_enemy(enemy_position: Vector2) -> void:
	var new_enemy = Enemy.instantiate()
	%Entities.add_child(new_enemy)
	new_enemy.position = enemy_position
	

func _on_timer_timeout() -> void:
	if game.player:
		var spawn_path: PathFollow2D = game.player.get_node("EnemySpawnPath/PathFollow2D")
		spawn_path.progress_ratio = game.rng.randf()
		spawn_enemy(spawn_path.global_position)
