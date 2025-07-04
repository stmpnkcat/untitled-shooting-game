class_name CollectibleComponent
extends Area2D


signal collected(body: Node2D)
var is_collected: bool = false
var player: Node2D

@onready
var parent: Node2D = get_parent()


func _ready() -> void:
	connect("area_entered", Callable(self, "_on_area_entered"))
	connect("body_entered", Callable(self, "_on_body_entered"))


func _on_area_entered(area: Area2D) -> void:
	is_collected = true
	player = area
	disconnect("area_entered", Callable(self, "_on_area_entered"))


func _physics_process(delta: float) -> void:
	if is_collected:
		var to_player: Vector2 = player.global_position - parent.global_position
		var distance: float = to_player.length()
		var movement_speed: float = max(game.player.movement_speed * 1.5, distance * 10)

		parent.global_position += to_player.normalized() * movement_speed * delta


func _on_body_entered(body: Node2D) -> void:
	emit_signal("collected", body)
	parent.queue_free()
