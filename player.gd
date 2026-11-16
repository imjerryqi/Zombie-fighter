extends Node2D



var max_speed := 1200.0
var velocity := Vector2(0, 0)
var steering_factor := 3.0
var health := 50
var gem_count := 0



func _ready() -> void:
	set_health(50)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction := Vector2(0, 0)
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")
	
	
	
	var desired_velocity := max_speed * direction
	var steering := desired_velocity - velocity
	velocity += steering * steering_factor * delta
	position += velocity * delta
	
	
	if velocity.length() > 0.0:
		get_node("Sprite2D").rotation = velocity.angle()
		
	var viewport_size := get_viewport_rect().size
	position.x = wrapf(position.x, 0, viewport_size.x)
	position.y = wrapf(position.y, 0, viewport_size.y)
	
func set_health(new_health: int) -> void:
	health = new_health
	if health > 100:
		health = 100
	if health <= 0:
		queue_free()
		
		get_node("UI/ProgressBar").value = health
