extends Node2D
class_name PhysicsComponent


@onready var parent: Node2D = get_parent()

var base_velocity: Vector2 = Vector2.ZERO: 
	set(new_base_velocity):
		base_velocity = new_base_velocity
		parent_set_velocity()

var ext_velocity: Vector2 = Vector2.ZERO: 
	set(new_ext_velocity):
		ext_velocity = new_ext_velocity
		parent_set_velocity()

var impulse_velocity: Vector2 = Vector2.ZERO: 
	set(new_impulse_velocity):
		impulse_velocity = new_impulse_velocity
		parent_set_velocity()

const IMPULSE_DECAY_FACTOR: float = 1000


func parent_set_velocity() -> void:
	if impulse_velocity:
		parent.velocity = impulse_velocity
	else:
		parent.velocity = base_velocity + ext_velocity


func handle_collisions() -> void:
	for index in parent.get_slide_collision_count():
		var collision: KinematicCollision2D = parent.get_slide_collision(index)
		var collider: CharacterBody2D = collision.get_collider()
		ext_velocity = collision.get_normal() * collider.velocity.length()


func _draw() -> void:
	draw_line(Vector2.ZERO, impulse_velocity, Color.YELLOW, 2.0)
	draw_line(Vector2.ZERO, ext_velocity, Color.GREEN, 2.0)
	draw_line(Vector2.ZERO, base_velocity, Color.BLUE, 2.0)


func _physics_process(delta: float) -> void:
	parent_set_velocity()
	
	#parent is CharacterBody2D
	if parent is CharacterBody2D:
		#handle_collisions()
		parent.move_and_slide()
	
	queue_redraw()
	ext_velocity = Vector2.ZERO
	impulse_velocity = impulse_velocity.move_toward(Vector2.ZERO, delta * IMPULSE_DECAY_FACTOR)


func add_impulse(impulse: Vector2) -> void:
	impulse_velocity += impulse
