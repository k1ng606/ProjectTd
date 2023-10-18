extends Node2D

@onready var enemy:PackedScene = preload("res://scenes/enemy.tscn")


func SpawnEnemies(number_of_enemies_to_spawn:int = 1):
	for i in number_of_enemies_to_spawn:
		add_child(enemy.instantiate())

func _ready()-> void:
	SpawnEnemies()
	timerSetup()
	
	
func timerSetup() -> void:
	get_tree().create_timer(3).timeout.connect(func() : SpawnEnemies())
