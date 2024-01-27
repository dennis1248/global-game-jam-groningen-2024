extends CharacterBody2D

const SPEED = 300.0
var my_random_number: int
var has_bounced: bool = false


func _physics_process(_delta):
	if not has_bounced: 
		if my_random_number == 0:
			velocity.x = 300
			velocity.y = 0
		elif my_random_number == 1:
			velocity.x = -300
			velocity.y = 0
		elif my_random_number == 2:
			velocity.y = 300
			velocity.x = 0
		else: 
			velocity.y = -300
			velocity.x = 0
			
	if velocity.x > 0: 
		%MouseSprite.flip_h = true
	else:
		%MouseSprite.flip_h = false
		
	move_and_slide()

func _on_walktimer_timeout():
	var rng = RandomNumberGenerator.new()
	my_random_number = rng.randi_range(0, 3)
	 
func _on_walls_body_entered(_body):
	%Bouncetimer.start() 
	
	if not has_bounced: 
		velocity.y *= -1
		velocity.x *= -1
		
		var rng = RandomNumberGenerator.new()
		my_random_number = rng.randi_range(0, 3)
	
	has_bounced = true; 

func _on_bouncetimer_timeout():
	has_bounced = false
