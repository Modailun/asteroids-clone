class_name Player extends CharacterBody2D

@onready var state_machine: Node = $StateMachine
@onready var screen_size = get_viewport_rect().size
@onready var hurt_box: Area2D = $HurtBox

signal player_died

func _ready() -> void:
	state_machine.init(self)

func _physics_process(_delta: float) -> void:
	state_machine.process_physics(_delta)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _process(_delta: float) -> void:
	state_machine.process_frame(_delta)

func died() -> void:
	print("Player died")
	player_died.emit()