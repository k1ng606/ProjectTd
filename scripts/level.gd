extends Node2D

@onready var enemy:PackedScene = preload("res://scenes/enemy.tscn")


func SpawnEnemies() -> void:
	for i in 1:
		add_child(enemy.instantiate())

func _ready()-> void:
	SpawnEnemies()
