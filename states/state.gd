class_name State extends Node

@export var rotation_speed: float = 3.0
@export var thrust_power: float = 3.0
@export var friction: float = 0.99

var parent: Player

func enter() -> void:
	pass

func exit() -> void:
	pass

func process_physics(_delta: float) -> State:
	return null

func process_input(_event: InputEvent) -> State:
	return null

func process_frame(_delta: float) -> State:
	return null