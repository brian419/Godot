extends Node2D

var enemy_scene_path = preload("res://scenes/enemy.tscn")
var enemy_instances = []
var enemy_instance

func _ready():
	print("Spawner ready")
	spawn_enemy(2)

func spawn_enemy(num_enemies):
	for i in range(num_enemies):
		print("Spawning enemy " + str(i+1) + " ...")
		
		enemy_instance = enemy_scene_path.instantiate()
		var offset = Vector2(i * 50, 0)
		enemy_instance.position = Vector2(137, 63) + offset
		add_child(enemy_instance)
		enemy_instances.append(enemy_instance)
		print(enemy_instances[i])
		enemy_instance.body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("enemy"):
		print("Collision with enemy detected")
	elif body.is_in_group("player"):
		print("Collision with player detected")
		for enemy_instance in enemy_instances:
			enemy_instance.queue_free()
			enemy_instances.erase(enemy_instance)
			break
	else:
		print("Collision with something else detected")
		
