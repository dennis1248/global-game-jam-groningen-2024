extends Control

func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://levels/level_1.tscn")

func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://levels/level_2.tscn")

func _on_level_3_pressed():
	get_tree().change_scene_to_file("res://levels/level_3.tscn")

func _on_credits_pressed():
	get_tree().change_scene_to_file("res://menu/credits.tscn")
	
func _on_exit_pressed():
	get_tree().quit()
