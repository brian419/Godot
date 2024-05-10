extends Node2D

var enemy_scene_path = preload("res://scenes/enemy.tscn")
var enemy_instances = []
var enemy_instance
var potion_scene_path = preload("res://scenes/HealthPotion.tscn")
var potion_instances = []
var potion_instance
var player
var original_healthbar = 200
var current_healthbar = original_healthbar
var random_speed
var max_number_health_potions

signal half_health
signal picked_up_health_potion


@onready var timer_for_health_death = $TimerForHealthDeath
@onready var progress_bar = $UI/CanvasLayer/PlayerHealthBar/ProgressBar


func _ready():
	player = get_node("Player")
	spawn_enemy(40)
	spawn_health_potions(100, player.position)
	progress_bar.value = original_healthbar


func spawn_enemy(num_enemies):
	for i in range(num_enemies):
		enemy_instance = enemy_scene_path.instantiate()
		# Randomize position
		var random_position = Vector2(randf_range(-1000, 1000), randf_range(-1000, 1000))
		enemy_instance.position = random_position
		
		# Randomize direction (angle)
		#var random_angle = randf_range(0, 360)
		#enemy_instance.rotation_degrees = random_angle
		
		add_child(enemy_instance)
		enemy_instances.append(enemy_instance)
		enemy_instance.body_entered.connect(_on_body_entered)
		
	# Move the enemies towards the player x and y position.... 
	for enemy_instance in enemy_instances:
			enemy_instance.set_process(true)
		
func spawn_health_potions(num_potions, player_position):
	max_number_health_potions = (num_potions / 10)
	print("Max number of health potions: ", max_number_health_potions)
	var tilemap = get_node("TileMap") 
	var tileset = tilemap.tile_set
	var tile_size = tileset.tile_size
	
	var rollValue = 0
	var correctNumber = 1
	var countCorrectNumber = 0
	
	for i in range(num_potions):
		rollValue = randi() % 10 #randi() % 10 represents 0 to 9
		potion_instance = null
		if (rollValue == correctNumber && countCorrectNumber < max_number_health_potions):
			potion_instance = potion_scene_path.instantiate()
			var random_potion_instance = Vector2(randf_range(-100,100), randf_range(-100,100))		
			var spawn_potion_position = random_potion_instance + player_position
			countCorrectNumber += 1
			#print("Number of times it hit the right value: ", countCorrectNumber)
			potion_instance.position = spawn_potion_position
			add_child(potion_instance)
			potion_instances.append(potion_instance)
			potion_instance.body_entered.connect(_on_body_entered_health_potion)
	print("Number of health potions spawned: ", countCorrectNumber)
		
func _process(delta):
	# Move enemies towards the player
	for enemy_instance in enemy_instances:
		if player and enemy_instance.position.distance_to(player.position) > 100:
			var direction = (player.position - enemy_instance.position).normalized()
			random_speed = (randf_range(50,100))  
			enemy_instance.position += direction * random_speed * delta	
			if direction.x > 0:
				if enemy_instance.has_node("EnemyAnimatedSprite2D"):
					var sprite = enemy_instance.get_node("EnemyAnimatedSprite2D")
					sprite.scale.x = 1  # Flip horizontally
			if direction.x < 0:
				if enemy_instance.has_node("EnemyAnimatedSprite2D"):
					var sprite = enemy_instance.get_node("EnemyAnimatedSprite2D")
					sprite.scale.x = -1  # Flip horizontally
			var sprite = enemy_instance.get_node("EnemyAnimatedSprite2D")
			sprite.play("move")

		else:
			# If the enemy is not moving, play the idle animation
			if enemy_instance.has_node("EnemyAnimatedSprite2D"):
				var sprite = enemy_instance.get_node("EnemyAnimatedSprite2D")
				sprite.play("idle")
	
		
func _on_body_entered(body):
	if body.is_in_group("player"):
		current_healthbar -= 1
		progress_bar.value -= 1
		if current_healthbar < (original_healthbar / 2):
			half_health.emit()
		if current_healthbar <= 0:
			Engine.time_scale = 0.5 
			body.get_node("CollisionShape2D").queue_free()
			timer_for_health_death.start()

	#if body.is_in_group("WeaponSword"):
		#if enemy_instance and not enemy_instance.is_queued_for_deletion():
			#if body in enemy_instance.get_overlapping_bodies():
				#enemy_instance.queue_free()
				#enemy_instances.erase(enemy_instance)
				
	if body.is_in_group("WeaponSword"):
		for enemy in enemy_instances:
			if enemy and not enemy.is_queued_for_deletion():
				if body in enemy.get_overlapping_bodies():
					enemy.queue_free()
					enemy_instances.erase(enemy)
					break
	else:
		pass
		
	

func _on_timer_for_health_death_timeout():
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()




func _on_hot_bar_use_health_potion():
	current_healthbar += 20
	progress_bar.value += 20



# Idea for Health Potion Pick-up:
# Check if it's spawning on top of a tile (dirt block), if it's a valid 
# spawn location, roll a random number. if that number matches like 1000 then spawn the health 
# potion on the ground. 
# else, skip the spawning of the potion. 
# so say we rolled a 999 (it goes 0 to 999 for range of random numbers),
# then that means we had a 1/1000 chance to spawn a potion

func _on_body_entered_health_potion(body):
	if body.is_in_group("player"):
		for potion in potion_instances:
			if potion and not potion.is_queued_for_deletion():
				if body in potion.get_overlapping_bodies():
					potion.queue_free()
					potion_instances.erase(potion)
					break
		picked_up_health_potion.emit()
		
	else:
		pass

