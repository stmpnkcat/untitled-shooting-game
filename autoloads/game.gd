extends Node

var player
var rng = RandomNumberGenerator.new()
var current_scene

func _ready() -> void:
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)
	
	
func switch_scene(scene_path) -> void:
	call_deferred("_deferred_switch_scene", scene_path)
	

func _deferred_switch_scene(scene_path) -> void:
	current_scene.free()
	var scene : PackedScene = load(scene_path)
	current_scene = scene.instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene
