extends Control

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://menu/main.tscn")


func _on_loop_through_credits_timeout():
	%BoxContainer/Label5.hide() 
