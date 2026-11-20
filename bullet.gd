extends Area2D

var velocity = Vector2(100, 0)
var min_speed := 700 
var max_speed := 800



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_local_x(velocity.x * delta)
	var viewport_size := get_viewport_rect().size
	position.x = wrapf(position.x, 0, viewport_size.x)
	position.y = wrapf(position.y, 0, viewport_size.y)


func _on_timer_timeout() -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
