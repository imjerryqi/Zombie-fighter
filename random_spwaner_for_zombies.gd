extends Node2D

func _on_timer_timeout() -> void:
	var meteor_position := Vector2(0, 0)
	var screen_edge = ["top", "bottom", "left", "right"]
	var item_prefabs = [preload("boost_zombie.tscn"), preload("normal_zombie.tscn"), preload("Gargantuar.tscn"), preload("disco_zombie.tscn")]
	var item_scene : PackedScene = item_prefabs.pick_random()
	var item_instance : Node = item_scene.instantiate()
	add_child(item_instance)
	var viewport_size := get_viewport_rect().size
	var screen_spwan = screen_edge.pick_random()
