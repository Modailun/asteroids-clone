extends State

@export var idle_state: State

func enter() -> void:
	print("move")
	super()

func process_physics(delta: float) -> State:

	parent.position.x = wrapf(parent.position.x, 0, parent.screen_size.x)
	parent.position.y = wrapf(parent.position.y, 0, parent.screen_size.y)

	if Input.is_action_pressed("ui_right"):
		# Move to the right
		parent.rotation += rotation_speed * delta
	elif Input.is_action_pressed("ui_left"):
		# Move to the left
		parent.rotation -= rotation_speed * delta

	var thrust_vector: Vector2 = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		thrust_vector = Vector2.UP.rotated(parent.rotation) * thrust_power
	
	# Appliquer la friction
	var current_velocity: Vector2 = parent.velocity
	current_velocity *= friction
	
	# Ajouter la propulsion
	parent.velocity = current_velocity + thrust_vector

	# Move the player and handle collisions
	parent.move_and_slide()

	if not Input.is_anything_pressed() and parent.velocity == Vector2.ZERO:
		return idle_state
	return null

func process_input(event: InputEvent) -> State:
	if event.is_action_pressed("shoot") and can_shoot:
		shoot()
		can_shoot = false
		cooldown.start()
	return null

func shoot():
	var bullet = Bullet.instantiate()
	parent.get_parent().add_child(bullet)
	bullet.transform = marker_2d.global_transform

func _on_cooldown_timeout() -> void:
	can_shoot = true
