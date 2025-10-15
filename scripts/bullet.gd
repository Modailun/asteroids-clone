extends Area2D

@onready var screen_size = get_viewport_rect().size
var speed = 200

func _physics_process(delta):
	position.x = wrapf(position.x, 0, screen_size.x)
	position.y = wrapf(position.y, 0, screen_size.y)

	position += transform.x * speed * delta

func _on_timer_timeout() -> void:
	queue_free()
