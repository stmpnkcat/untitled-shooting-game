extends ProgressBar


@onready var parent: Node2D = get_parent()
@onready var health_component : HealthComponent = parent.get_node_or_null("HealthComponent")


func _process(delta: float) -> void:
	if health_component:
		value = health_component.current_health
