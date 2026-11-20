extends Node2D

var max_speed := 1200.0
var velocity := Vector2(0, 0)
var steering_factor := 3.0
var health := 50
var gem_count := 0

func _ready() -> void:
	set_health(50)

func _process(delta: float) -> void:
	# 1. Check if health has reached 0 to delete the ship (Bounds / Status Check)
	if health <= 0:
		queue_free()
		return # Exit early so we don't process movement for a dead ship

	var direction := Vector2(0, 0)
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")
	if Input.is_action_just_pressed("shoot"):
		var item_scene : PackedScene = preload("bullet.tscn")
		var item_instance := item_scene.instantiate()
		get_tree().current_scene.add_child(item_instance)
		item_instance.position = position

	
	
	if direction.length() > 1.0:
		direction = direction.normalized()

	var desired_velocity := max_speed * direction
	var steering := desired_velocity - velocity
	velocity += steering * steering_factor * delta
	position += velocity * delta

	
		
	var viewport_size := get_viewport_rect().size
	position.x = wrapf(position.x, 0, viewport_size.x)
	position.y = wrapf(position.y, 0, viewport_size.y)

func set_health(new_health: int) -> void:
	health = new_health
	if health > 100:
		health = 100
	if health < 0:
		health = 0
	


func set_gem_count(new_gem_count: int) -> void:
	gem_count = new_gem_count
	get_node("UI/GemCount").text = "x" + str(gem_count)

func _on_area_entered(area: Area2D) -> void:
	
	print(area.name)
	print(area.get_groups())
	if area.is_in_group("Health Pack"):
		set_health(health + 10)
		area.queue_free()

	elif area.is_in_group("Coin"):
		set_gem_count(gem_count + 1)
		area.queue_free() 

	elif area.is_in_group("Normal Zombie"):
		set_health(health - 10)
		area.queue_free() 

	elif area.is_in_group("Boost Zombie"):
		set_health(health - 5)
		area.queue_free()

	elif area.is_in_group("Gargantuar"):
		set_health(health - 20)
		area.queue_free() 

	elif area.is_in_group("Disco Zombie"):
		set_health(health - 10)
		area.queue_free()

	elif area.is_in_group("Small Zombie"):
		set_health(health - 5)
		area.queue_free()
