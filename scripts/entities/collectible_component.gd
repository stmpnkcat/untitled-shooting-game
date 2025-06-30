class_name CollectibleComponent
extends Area2D


signal collected(body: Node2D)
var is_collected := false
var player: Area2D

@onready
var parent : Node2D = get_parent()

func _ready() -> void:
	connect("area_entered", Callable(self, "_on_area_entered"))
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_area_entered(area: Area2D) -> void:
	if not is_collected:
		is_collected = true
		player = area	

func _physics_process(delta: float) -> void:
	if is_collected:
		var to_player := player.global_position - parent.global_position
		var distance := to_player.length()
		var speed := distance * 5

		parent.global_position += to_player.normalized() * speed * delta

func _on_body_entered(body: Node2D) -> void:
	emit_signal("collected", body)
	parent.queue_free()
