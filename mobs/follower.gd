extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var player = $"../Player"
var positions = [] 

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	
	if self.position.distance_to(player.position) < 75: 
		return
	
	var x = player.position.x 
	var y = player.position.y 

	position = position.move_toward(Vector2(x, y), delta * SPEED)
	

	move_and_slide()

func _on_timer_timeout():
	%Timer.wait_time = randi() % 15 + 5
	$AudioStreamPlayer.play()


func _on_position_timeout():
	%Position.start() 
	
	positions.append(player.position.x) 
	
	if len(positions) > 1:
		if positions[0] > positions[1] or positions[0] < positions[1]:
			$AnimationPlayer.play("dog_walk")
		else:
			$AnimationPlayer.play("idle_dog")
		positions.pop_at(0)
