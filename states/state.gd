class_name State extends Node

@export var rotation_speed: float = 4.0
@export var thrust_power: float = 1.5
@export var friction: float = 0.99
@export var Bullet : PackedScene = load('res://scenes/bullet.tscn')
@onready var marker_2d: Marker2D = %Marker2D
@onready var cooldown: Timer = %Cooldown

var can_shoot: bool = true

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