extends CharacterBody2D


const SPEED = 130.0
#const JUMP_VELOCITY = -300.0

@onready var animated_sprite = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	#print("testing ready in player.gd")
	pass

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		#velocity.y += gravity * delta
		pass

	# Handle jump.
	#if Input.is_action_just_pressed("jump") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	#var direction = Input.get_axis("move_left", "move_right", "move_up", "move_down")
	#var direction = Input.get_axis("move_left", "move_right")
	
	# Flip the Sprite
	#if direction > 0:
		#animated_sprite.flip_h = false
	#elif direction < 0:
		#animated_sprite.flip_h = true
		
	# Flip the Sprite
	#if direction.x > 0:
		#animated_sprite.flip_h = false
	#elif direction.x < 0:
		#animated_sprite.flip_h = true
	#
	#
	##Play animations
	#if is_on_floor():
		#if direction == 0:
			#animated_sprite.play("idle")
		#else: 
			#animated_sprite.play("move")
	##else: animated_sprite.play("jump")
	#
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()

	
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	elif Input.is_action_pressed("move_down"):
		direction.y += 1
		
	if direction.length_squared() > 0:
		direction = direction.normalized()

		if direction.x > 0:
			animated_sprite.flip_h = false
		elif direction.x < 0:
			animated_sprite.flip_h = true

		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if is_on_floor():
		if (direction == Vector2.ZERO || direction.length_squared() == 0 || velocity == Vector2.ZERO):
			animated_sprite.play("idle")
		else: 
			animated_sprite.play("move")
	#else: animated_sprite.play("jump")
	
	move_and_slide()
	
	if not Input.is_action_pressed("move_up") and not Input.is_action_pressed("move_down"):
		velocity.y = 0

