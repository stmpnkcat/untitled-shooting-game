class_name PathfindComponent
extends Node2D

func follow_target(target: Node2D) -> void:
	owner.velocity = global_position.direction_to(target.position).normalized() * owner.speed
