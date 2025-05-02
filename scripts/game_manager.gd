extends Node

@export var Player: PackedScene
@export var Enemy: PackedScene

const PLAYER_SPAWN_POSITION = Vector2(0, 0)

func _ready():
	var new_player = Player.instantiate()
	add_child(new_player)
	new_player.position = PLAYER_SPAWN_POSITION
	
