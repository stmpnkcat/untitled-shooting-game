extends Control

func _on_play_pressed() -> void:
	game.switch_scene("res://scenes/main.tscn")


func _on_options_pressed() -> void:
	game.switch_scene("res://scenes/options_menu.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()
