extends Node2D


var item_prefabs := [preload("coin.tscn"), preload("health_pack.tscn")]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_timer_timeout() -> void:
	var item_scene : PackedScene = item_prefabs.pick_random()
	var item_instance := item_scene.instantiate()
	add_child(item_instance)
	var viewport_size := get_viewport_rect().size
	item_instance.position = Vector2(randf_range(0, viewport_size.x), randf_range(0, viewport_size.y))


func _on_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
