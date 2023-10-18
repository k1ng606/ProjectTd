extends CharacterBody2D

@onready var targetPosition : Vector2 = $"../EnemyTarget".position
@onready var enemySpawnPosition : Vector2 = $"../EnemySpawn".position
@onready var navigation_agent := $NavigationAgent2D

const speed := 200

func _ready() -> void:
	
	navigation_agent.path_desired_distance = 4.0
	navigation_agent.target_desired_distance = 4.0
	
	position = enemySpawnPosition

	# Make sure to not await during _ready.
	call_deferred("actor_setup")


func actor_setup()-> void:
	await get_tree().physics_frame
	set_movement_target(targetPosition)
	
func set_movement_target(movement_target: Vector2):
	navigation_agent.target_position = movement_target

func _physics_process(_delta: float) -> void:
	if navigation_agent.is_navigation_finished():
		self.queue_free()

	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()

	var new_velocity: Vector2 = next_path_position - current_agent_position
	new_velocity = new_velocity.normalized()
	new_velocity = new_velocity * speed

	velocity = new_velocity
	move_and_slide()
