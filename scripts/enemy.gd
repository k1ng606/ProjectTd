extends CharacterBody2D

@onready var targetPosition : Vector2 = $"../EnemyTarget".position

@onready var enemySpawnPosition : Vector2 = $"../EnemySpawn".position

@onready var navigationAgent := $NavigationAgent2D

const speed := 5000

func _ready() -> void:
	position = enemySpawnPosition
	navigationAgent.target_position = targetPosition


func _physics_process(_delta: float) -> void:
	await get_tree().physics_frame
	var direction := to_local(navigationAgent.get_next_path_position()).normalized()
	
	velocity = direction * speed * _delta
	
	move_and_slide()
	
	#if (position == targetPosition):
		




func _on_navigation_agent_2d_target_reached():
	self.queue_free()
