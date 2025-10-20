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
	call_deferred("reset_player") # TODO: Mettre une animation à la place 

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

func asteroid_died(size: String, asteroid: Node2D) -> void:
	match size:
		"BIG":
			print("Big Asteroid died")
			call_deferred("kill_big_asteroid", asteroid)
		"MEDIUM":
			print("Medium Asteroid died")
			call_deferred("kill_medium_asteroid", asteroid)
		"SMALL":
			print("Small Asteroid died")
			call_deferred("kill_small_asteroid", asteroid)

func kill_big_asteroid(asteroid: Node2D) -> void:
	var medium_asteroid_1 = medium_asteroid_scene.instantiate()
	var medium_asteroid_2 = medium_asteroid_scene.instantiate()
	medium_asteroid_1.position = asteroid.position + Vector2(16, 0)
	medium_asteroid_2.position = asteroid.position + Vector2(-16, 0)
	add_child(medium_asteroid_1)
	add_child(medium_asteroid_2)
	medium_asteroid_1.asteroid_died.connect(asteroid_died)
	medium_asteroid_2.asteroid_died.connect(asteroid_died)
	asteroid.queue_free()

func kill_medium_asteroid(asteroid: Node2D) -> void:
	var small_asteroid_1 = small_asteroid_scene.instantiate()
	var small_asteroid_2 = small_asteroid_scene.instantiate()
	small_asteroid_1.position = asteroid.position + Vector2(8, 0)
	small_asteroid_2.position = asteroid.position + Vector2(-8, 0)
	add_child(small_asteroid_1)
	add_child(small_asteroid_2)
	small_asteroid_1.asteroid_died.connect(asteroid_died)
	small_asteroid_2.asteroid_died.connect(asteroid_died)
	asteroid.queue_free()

func kill_small_asteroid(asteroid: Node2D) -> void:
	asteroid.queue_free()