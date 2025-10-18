extends Node2D

@export var player_scene = Resource
@export var big_asteroid_scene = Resource
@export var medium_asteroid_scene = Resource
@export var small_asteroid_scene = Resource

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reset_player()
	reset_asteroids()

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

func reset_asteroids() -> void:
	for child in get_children():
		if child is Asteroids:
			child.queue_free()
	var big_asteroid_1 = big_asteroid_scene.instantiate()
	var big_asteroid_2 = big_asteroid_scene.instantiate()
	big_asteroid_1.position = Vector2(randi() % 128, randi() % 180)
	big_asteroid_2.position = Vector2(randi() % 128 + 192, randi() % 180)
	add_child(big_asteroid_1)
	add_child(big_asteroid_2)
	big_asteroid_1.asteroid_died.connect(asteroid_died)
	big_asteroid_2.asteroid_died.connect(asteroid_died)

func asteroid_died() -> void:
	print("Asteroid died")