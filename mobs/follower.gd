extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var player = $"../Player"

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	var xDeviation = self.position.x - player.position.x 
	var yDeviation = self.position.x - player.position.y 
	
	if self.position.distance_to(player.position) < 75: 
		return

		
	var x = player.position.x 
	var y = player.position.y 

	position = position.move_toward(Vector2(x, y), delta * SPEED)
	
	

	move_and_slide()
