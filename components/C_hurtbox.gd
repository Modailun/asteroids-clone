class_name HurtboxComponent extends Node

signal damage_taken

@export var hurt_box: Area2D

func _ready() -> void:
	hurt_box.area_entered.connect(collision)

func collision(_body) -> void:
	damage_taken.emit(1)