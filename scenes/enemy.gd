extends CharacterBody2D

@onready
var targetPosition : Vector2 = $"../EnemyTarget".position

@onready var navigationAgent := $NavigationAgent2D

const speed := 5000

func _ready() -> void:
	navigationAgent.target_position = targetPosition


func _physics_process(_delta: float) -> void:
	await get_tree().physics_frame
	var direction = to_local(navigationAgent.get_next_path_position()).normalized()
	
	velocity = direction * speed * _delta
	
	move_and_slide()


