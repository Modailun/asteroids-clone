extends Node2D

@export var player_scene = Resource

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_player()

func create_player() -> void:
	var player = player_scene.instantiate()
	player.position = Vector2(160, 90)
	add_child(player)