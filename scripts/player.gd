extends CharacterBody2D


@export var speed = 300


func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("ui_right"):
		rotate(-0.1)
	if Input.is_action_pressed("ui_left"):
		rotate(0.1)
	if Input.is_action_pressed("ui_up"):
		velocity.x = -speed * cos(rotation) * delta
		velocity.y = -speed * sin(rotation) * delta

	move_and_slide()
