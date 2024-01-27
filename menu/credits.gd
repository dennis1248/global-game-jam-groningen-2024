extends Control
var counter: int = 0

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://menu/main.tscn")


func _on_loop_through_credits_timeout():
	counter += 1
	%LoopThroughCredits.start() 
	if counter == 1: 
		%Label10.visible = false
		%Angela.visible = false
		%Label5.visible = true
		%Damian.visible = true
	elif counter == 2:
		%Label5.visible = false
		%Damian.visible = false
		%Label4.visible = true
		%Dennis.visible = true
	elif counter == 3: 
		%Label4.visible = false
		%Dennis.visible = false
		%Label8.visible = true
		%Gideon.visible = true
	elif counter == 4: 
		%Label8.visible = false
		%Gideon.visible = false
		%Label7.visible = true
		%Lucy.visible = true
	elif counter == 5:
		%Label7.visible = false
		%Lucy.visible = false
		%Label6.visible = true
		%Mandy.visible = true
	elif counter == 6: 
		%Label6.visible = false
		%Mandy.visible = false
		%Label9.visible = true
		%Tyler.visible = true 
	
		


