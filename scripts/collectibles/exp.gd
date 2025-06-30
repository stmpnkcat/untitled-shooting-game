extends Node2D


@export
var collectible_component: CollectibleComponent
var exp: float


func _on_collectible_component_collected(area: Area2D) -> void:
	print("collected")
