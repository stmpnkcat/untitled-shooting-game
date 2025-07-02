extends Node2D

@export
var BULLET : PackedScene
@export
var damage : float
@export
var speed : float
@export
var max_range : float

@onready
var shooting_point : Marker2D = $WeaponPivot/Sprite2D/ShootingPoint

func _physics_process(delta: float) -> void:
		
		look_at(get_global_mouse_position())
		
		if $ShootingTimer.is_stopped() and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			shoot()
			$ShootingTimer.start()


func shoot() -> void:
	
	var new_bullet: Node2D = BULLET.instantiate()
	
	new_bullet.global_position = shooting_point.global_position
	new_bullet.global_rotation = shooting_point.global_rotation
	new_bullet.damage = damage
	new_bullet.speed = speed
	new_bullet.max_range = max_range
	get_node("/root/Main/Projectiles").add_child(new_bullet)
