extends Node2D

@export var player_scene = Resource

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reset_player()

func reset_player() -> void:
	for child in get_children():
		if child is Player:
			child.queue_free()
	var player = player_scene.instantiate()
	player.position = Vector2(160, 90)
	add_child(player)
	player.player_died.connect(player_died)

func player_died() -> void:
	call_deferred("reset_player")