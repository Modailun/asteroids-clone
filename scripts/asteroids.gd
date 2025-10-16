extends Node2D

@onready var screen_size = get_viewport_rect().size

func _ready() -> void:
	var direction = Vector2(randf_range(-1, 1), randf_range(-1, 1))
	rotation = direction.angle()

func _physics_process(delta: float) -> void:
	position.x = wrapf(position.x, 0, screen_size.x)
	position.y = wrapf(position.y, 0, screen_size.y)

	position += transform.x * 32 * delta


func died() -> void:
	print("Asteroid died")
