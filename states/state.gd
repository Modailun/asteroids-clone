class_name State extends Node

@export var speed: int = 32
@export var rotation_speed: float = .05

var parent: Player

func enter() -> void:
	pass

func exit() -> void:
	pass

func process_physics(delta: float) -> State:
	return null

func process_input(event: InputEvent) -> State:
	return null

func process_frame(delta: float) -> State:
	return null