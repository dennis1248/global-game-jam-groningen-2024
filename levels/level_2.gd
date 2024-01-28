extends Node2D

var keys_collected: int = 0
var narrator_response: String = ""
@onready var dog_cage_pos = $DogCage.position

func _ready():
	narrator_response = "intro"
	%Ambiance.play()
	%NarratorTimer.start()
	
func _input(event):
	if event.is_action_pressed("escape"):
		get_tree().change_scene_to_file("res://menu/main.tscn")

func _on_touch_body_entered(body):
	if body.has_method("key_del"):
		body.key_del()
		keys_collected += 1
		narrator_response = "key_collected"
		%NarratorTimer.start()
		
	if body.has_method("del_dog") and keys_collected == 3:
		body.del_dog()
		var new_dog = preload("res://mobs/follower.tscn").instantiate()
		new_dog.global_position = dog_cage_pos
		add_child(new_dog)

func _on_narrator_timer_timeout():
	print("AAAA")
	if narrator_response == "intro":
		%NarratorAudioplayer.stream = load("res://audio/narrator/level_2_intro.mp3")
		%NarratorAudioplayer.play()
	
	if narrator_response == "key_collected" and keys_collected == 1:
		%NarratorAudioplayer.stream = load("res://audio/narrator/level_2_key_1.mp3")
		%NarratorAudioplayer.play()
	
	if narrator_response == "key_collected" and keys_collected == 2:
		%NarratorAudioplayer.stream = load("res://audio/narrator/level_2_key_2.mp3")
		%NarratorAudioplayer.play()
	
	if narrator_response == "key_collected" and keys_collected == 3:
		%NarratorAudioplayer.stream = load("res://audio/narrator/level_2_key_3.mp3")
		%NarratorAudioplayer.play()

	if narrator_response == "dog_saved":
		%NarratorAudioplayer.stream = load("res://audio/narrator/level_2_dog_saved.mp3")
		%NarratorAudioplayer.play()
	
	narrator_response = ""

func _on_ambiance_finished():
	%Ambiance.play()
