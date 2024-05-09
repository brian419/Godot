extends Node2D

var enemy_scene_path = preload("res://scenes/enemy.tscn")
var enemy_instances = []
var enemy_instance
var player
var original_healthbar = 200
var current_healthbar = original_healthbar

@onready var timer_for_health_death = $TimerForHealthDeath






func _ready():
	#print("Spawner ready")
	spawn_enemy(40)
	player = get_node("Player")
	print("Player health is at: ", original_healthbar)


func spawn_enemy(num_enemies):
	for i in range(num_enemies):
		#print("Spawning enemy " + str(i+1) + " ...")
		
		enemy_instance = enemy_scene_path.instantiate()
		
		# Randomize position
		var random_position = Vector2(randf_range(-1000, 1000), randf_range(-1000, 1000))
		enemy_instance.position = random_position
		
		# Randomize direction (angle)
		#var random_angle = randf_range(0, 360)
		#enemy_instance.rotation_degrees = random_angle
		
		add_child(enemy_instance)
		enemy_instances.append(enemy_instance)
		#print(enemy_instances[i])
		enemy_instance.body_entered.connect(_on_body_entered)
		
	# Move the enemies towards the player x and y position.... 
	for enemy_instance in enemy_instances:
			#print("test")	
			enemy_instance.set_process(true)
		
		
func _process(delta):
	# Move enemies towards the player
	for enemy_instance in enemy_instances:
		if player and enemy_instance.position.distance_to(player.position) > 100:
			var direction = (player.position - enemy_instance.position).normalized()
			var random_speed = (randf_range(50,100))  # Adjust as needed
			enemy_instance.position += direction * random_speed * delta
		
		
		
func _on_body_entered(body):
	if body.is_in_group("player"):
		print("player collided with enemy")
		current_healthbar -= 1
		print("player health is at: ", current_healthbar)
		if current_healthbar <= 0:
			print("AHHH I'M DEAD")
			Engine.time_scale = 0.5
			body.get_node("CollisionShape2D").queue_free()
			timer_for_health_death.start()
			
		
	if body.is_in_group("WeaponSword"):
		#print("Player collided with enemy")
		for enemy_instance in enemy_instances:
			if body in enemy_instance.get_overlapping_bodies():
				#print("Player collided with enemy:", enemy_instance)
				enemy_instance.queue_free()
				enemy_instances.erase(enemy_instance)
	else:
		#print("Collision with something else detected")
		pass
		
		

	



func _on_timer_for_health_death_timeout():
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
