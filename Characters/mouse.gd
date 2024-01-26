extends CharacterBody2D

const SPEED = 300.0
var my_random_number: int
var has_bounced: bool = false


func _physics_process(delta):
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
			
			print(velocity.y) 
			print(velocity.x) 
			print(has_bounced) 
	
	move_and_slide()

func _on_walktimer_timeout():
	
	var rng = RandomNumberGenerator.new()
	my_random_number = rng.randi_range(0, 3)
	 
	print(my_random_number);


func _on_walls_body_entered(body):
	
	has_bounced = true 
	
	%Bouncetimer.start() 
	
	if not has_bounced: 
		print("fuck this")
		velocity.y *= -1 
		velocity.x *= -1
	


func _on_bouncetimer_timeout():
	
	has_bounced = false
