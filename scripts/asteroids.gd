class_name Asteroids extends Node2D

@onready var screen_size = get_viewport_rect().size

@export var asteroid_stats = Resource

signal asteroid_died

func _ready() -> void:
	var direction = Vector2(randf_range(-1, 1), randf_range(-1, 1))
	rotation = direction.angle()

func _physics_process(delta: float) -> void:
	position.x = wrapf(position.x, 0, screen_size.x)
	position.y = wrapf(position.y, 0, screen_size.y)

	position += transform.x * asteroid_stats.speed * delta


func died() -> void:
	match asteroid_stats.taille:
		asteroid_stats.tailles.BIG:
			print("Big asteroid died")
			asteroid_died.emit("BIG", self)
		asteroid_stats.tailles.MEDIUM:
			print("Medium asteroid died")
			asteroid_died.emit("MEDIUM", self)
		asteroid_stats.tailles.SMALL:
			print("Small asteroid died")
			asteroid_died.emit("SMALL", self)
