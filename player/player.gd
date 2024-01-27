extends CharacterBody2D

const SPEED = 300.0

func _physics_process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")

	if velocity.x > 0:
		%AnimationPlayer.play("walk_right")
	elif velocity.x < 0:
		%AnimationPlayer.play("walk_left")
	elif velocity.y > 0:
		%AnimationPlayer.play("walk_down")
	elif velocity.y < 0:
		%AnimationPlayer.play("walk_up")
	else:
		%AnimationPlayer.play("idle")

	velocity = direction * SPEED
	
	move_and_slide()
