extends Area2D
var velocity = Vector2(0, 0)
var move_speed := 700
var Player : Node2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Player = get_tree().get_root().get_node("Player")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction := Player.position - position
	velocity = direction.normalized() * move_speed
	position += velocity * delta
	var viewport_size := get_viewport_rect().size
	position.x = wrapf(position.x, 0, viewport_size.x)
	position.y = wrapf(position.y, 0, viewport_size.y)
