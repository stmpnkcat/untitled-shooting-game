extends CharacterBody2D

@export
var speed : float
@onready
var player : CharacterBody2D = $/root/Main/Player
@onready
var pathfind_component : PathfindComponent = $PathfindComponent


func _ready() -> void:
	connect("died", Callable(self, "_on_death"))


func _process(delta: float) -> void:
	if player:
		pathfind_component.follow_target(player)


func _physics_process(delta: float) -> void:
	move_and_slide()


func _on_death() -> void:
	queue_free()
