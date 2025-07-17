extends Control

@onready var label: RichTextLabel = $RichTextLabel
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var number: float = 0

func _ready() -> void:
	label.text = str(int(number))
	animation_player.play("start")


func _on_animation_end() -> void:
	queue_free()
