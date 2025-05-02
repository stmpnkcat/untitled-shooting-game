extends Node2D

@export
var damage : float
@export
var speed : float
@export
var range : float

@onready
var detection_area : Area2D = $DetectionArea
@onready
var shooting_point : Marker2D = $WeaponPivot/Sprite2D/ShootingPoint
@onready
var detection_shape: CollisionShape2D = $DetectionArea/CollisionShape2D
@onready
var shooting_timer: Timer = $ShootingTimer

var enemies_in_range

func _physics_process(delta: float) -> void:
	
	enemies_in_range = detection_area.get_overlapping_bodies()
	
	if len(enemies_in_range) > 0:
		
		var min_dist: float = detection_shape.shape.radius
		var target_enemy = enemies_in_range.front()
		
		for enemy in enemies_in_range:
			if global_position.distance_to(enemy.global_position) <= min_dist:
				target_enemy = enemy
				min_dist = owner.global_position.distance_to(enemy.global_position)
		
		look_at(target_enemy.global_position)
		
		if shooting_timer.is_stopped():
			shoot()
			shooting_timer.start()


func shoot():
	
	const BULLET = preload("res://scenes/projectiles/bullet.tscn")
	
	var new_bullet = BULLET.instantiate()
	
	new_bullet.global_position = shooting_point.global_position
	new_bullet.global_rotation = shooting_point.global_rotation
	new_bullet.damage = damage
	new_bullet.speed = speed
	new_bullet.range = range
	
	shooting_point.add_child(new_bullet)
