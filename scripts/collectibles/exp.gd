extends Node2D


var exp_amount: float


func _on_collectible_component_collected(body: Node2D) -> void:
	game.exp_collected += exp_amount
