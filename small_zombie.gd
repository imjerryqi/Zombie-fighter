extends Area2D
var velocity = Vector2(0, 0)
var min_speed := 200
var max_speed := 400
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var random_dir := Vector2.from_angle(randf_range(0, TAU))
	var random_speed = randf_range(min_speed, max_speed)
	velocity = random_dir * random_speed



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += velocity * delta
	var viewport_size := get_viewport_rect().size
	position.x = wrapf(position.x, 0, viewport_size.x)
	position.y = wrapf(position.y, 0, viewport_size.y)
