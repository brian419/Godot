extends Node2D

var enemy_scene_path = preload("res://scenes/enemy.tscn")
var enemy_instances = []
var enemy_instance


func _ready():
	#print("Spawner ready")
	spawn_enemy(10)


func spawn_enemy(num_enemies):
	for i in range(num_enemies):
		#print("Spawning enemy " + str(i+1) + " ...")
		
		enemy_instance = enemy_scene_path.instantiate()
		
		# Randomize position
		var random_position = Vector2(randf_range(-200, 200), randf_range(-200, 200))
		enemy_instance.position = random_position
		
		# Randomize direction (angle)
		#var random_angle = randf_range(0, 360)
		#enemy_instance.rotation_degrees = random_angle
		
		add_child(enemy_instance)
		enemy_instances.append(enemy_instance)
		#print(enemy_instances[i])
		enemy_instance.body_entered.connect(_on_body_entered)
		
		
func _on_body_entered(body):
	if body.is_in_group("enemy"):
		print("Collision with enemy detected")
		pass
	elif body.is_in_group("player"):
		#print("Collision with player detected")
		for enemy_instance in enemy_instances:
			if body in enemy_instance.get_overlapping_bodies():
				print("Player collided with enemy:", enemy_instance)
				enemy_instance.queue_free()
				enemy_instances.erase(enemy_instance)
	else:
		print("Collision with something else detected")
		
		
