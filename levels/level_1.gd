extends Node2D

var loop_step: int = 0
var objective_completed: bool = false
var pressed_button: int = 0
var narrator_response: String = ""
var narrator_lock: bool = false

func _process(delta):
	if objective_completed:
		%LevelEnd.disabled = false
		$PianoButton/AudioStreamPlayer2D.play()

func _input(event):
	if event.is_action_pressed("escape"):
		get_tree().change_scene_to_file("res://menu/main.tscn")

func _on_piano_timer_timeout():
	if loop_step == 0:
		$PianoButton/AudioplayerLow.play()
		$PianoButton.modulate = Color(1.0, 0.0, 0.0, 1.0)
		loop_step = loop_step + 1
		return
	
	if loop_step == 1:
		$PianoButton3/AudioplayerHigh.play()
		$PianoButton3.modulate = Color(0.0, 0.0, 1.0, 1.0)
		loop_step = loop_step + 1
		return
		
	if loop_step == 2:
		$PianoButton2/AudioplayerMid.play()
		$PianoButton2.modulate = Color(0.0, 1.0, 0.0, 1.0)
		loop_step = loop_step + 1
		return

# Loop main music
func _on_audio_stream_player_finished():
	$AudioStreamPlayer.play()


func _on_piano_button_body_entered(body):
	if pressed_button == 0:
		pressed_button += 1
	else:
		narrator_response = "puzzel_fail"
		$NarratorPauseTimer.start()

func _on_piano_button_2_body_entered(body):
	if pressed_button == 2:
		pressed_button += 1
		narrator_response = "puzzel_success"
		$NarratorPauseTimer.start()
	else:
		narrator_response = "puzzel_fail"
		$NarratorPauseTimer.start()

func _on_piano_button_3_body_entered(body):
	if pressed_button == 1:
		pressed_button += 1
	else:
		narrator_response = "puzzel_fail"
		$NarratorPauseTimer.start()

func _on_narrator_pause_timer_timeout():
	if narrator_lock:
		return
	
	if narrator_response == "puzzel_fail":
		$NarratorStreamPlayer.stream = load("res://audio/narrator/level_1_fail.mp3")
		$NarratorStreamPlayer.play()
		narrator_response = "level_end"
		narrator_lock = true
	
	if narrator_response == "puzzel_success":	
		$NarratorStreamPlayer.stream = load("res://audio/narrator/level_1_success.mp3")
		$NarratorStreamPlayer.play()
		narrator_response = "level_end"


func _on_narrator_stream_player_finished():
	if narrator_response == "level_end":
		$NarratorStreamPlayer.stream = load("res://audio/narrator/level_1_end.mp3")
		$NarratorStreamPlayer.play()
		narrator_response = ""
