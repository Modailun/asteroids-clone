extends State

@export var move_state: State

func enter() -> void:
	print("idle")
	super()

func process_physics(_delta: float) -> State:
	if Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		return move_state
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
	print("can_shoot")
	can_shoot = true