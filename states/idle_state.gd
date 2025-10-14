extends State

@export var move_state: State
@export var shoot_state: State

func enter() -> void:
	print("idle")
	super()

func process_physics(_delta: float) -> State:
	if Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		return move_state
	if Input.is_action_pressed("shoot"):
		return shoot_state
	return null