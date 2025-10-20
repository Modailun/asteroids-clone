class_name HealthComponent extends Node

signal died

@export var max_health = 1
@export var current_health = 1
@export var hurt_box_component: HurtboxComponent

func _ready() -> void:
	hurt_box_component.damage_taken.connect(damage_taken)

func damage_taken(damage: int) -> void:
	current_health -= damage
	if current_health <= 0:
		died.emit()