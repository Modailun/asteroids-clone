extends State

@export var idle_state: State
@export var shoot_state: State

func enter() -> void:
	print("move")
	super()

func process_physics(delta: float) -> State:
	var direction := 0

	if Input.is_action_pressed("ui_right"):
		# Move to the right
		direction = 1
	elif Input.is_action_pressed("ui_left"):
		# Move to the left
		direction = -1
	
	if direction != 0:
		# Rotate the player
		parent.rotate(rotation_speed * direction)
	
	if Input.is_action_pressed("ui_up"):
		# Move the player
		parent.velocity.x = speed *sin(parent.rotation)
		parent.velocity.y = -speed * cos(parent.rotation)
	
	# Move the player and handle collisions
	parent.move_and_slide()

	if not Input.is_anything_pressed() and parent.velocity == Vector2.ZERO:
		return idle_state
	if Input.is_action_pressed("shoot"):
		return shoot_state
	return null