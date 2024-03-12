extends Node2D

@onready var enemy:PackedScene = preload("res://scenes/enemy.tscn")
@onready var mob_spawn_timer := $MobSpawnTimer
var spawnCounter := 0

func spawn_enemy() -> void:
	add_child(enemy.instantiate())
	spawnCounter += 1
	print("spawnCounter: " + str(spawnCounter))
	
	
func handle_timer_timeout() -> void:
	mob_spawn_timer.stop()
	spawnCounter = 0
	
	
func handle_button_press() -> void:
	mob_spawn_timer.start()
	get_tree().create_timer(10).timeout.connect(func() : handle_timer_timeout())
	

func _ready() -> void:
	var button := $Button
	button.pressed.connect(func() : handle_button_press())
	
	mob_spawn_timer.timeout.connect(func() : spawn_enemy())
	
