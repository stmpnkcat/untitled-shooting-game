extends ProgressBar

@export
var health_component : HealthComponent

func _process(delta: float) -> void:
	value = health_component.current_health
