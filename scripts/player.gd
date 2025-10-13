class_name Player extends CharacterBody2D

# @export var speed = 32
# @export var rotation_speed = .05

@onready var state_machine: Node = $StateMachine

func _ready() -> void:
	state_machine.init(self)

func _physics_process(_delta: float) -> void:
	state_machine.process_physics(_delta)
	# """
	# Physics process loop for the player.
	# This function is called every frame and handles the movement of the player.
	# """
	# var direction := 0

	# if Input.is_action_pressed("ui_right"):
	# 	# Move to the right
	# 	direction = 1
	# elif Input.is_action_pressed("ui_left"):
	# 	# Move to the left
	# 	direction = -1
	
	# if direction != 0:
	# 	# Rotate the player
	# 	rotate(rotation_speed * direction)
	
	# if Input.is_action_pressed("ui_up"):
	# 	# Move the player
	# 	velocity.x = speed *sin(rotation)
	# 	velocity.y = -speed * cos(rotation)
	
	# # Move the player and handle collisions
	# move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _process(_delta: float) -> void:
	state_machine.process_frame(_delta)

func died() -> void:
	print("Player died")