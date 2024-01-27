extends Node2D

var loop_step: int = 0
var objective_completed: bool = false

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
		$PianoButton3.modulate = Color(1.0, 0.0, 0.0, 1.0)
		loop_step = loop_step + 1
		return
		
	if loop_step == 2:
		$PianoButton2/AudioplayerMid.play()
		$PianoButton2.modulate = Color(1.0, 0.0, 0.0, 1.0)
		loop_step = loop_step + 1
		return

# Loop main music
func _on_audio_stream_player_finished():
	$AudioStreamPlayer.play()
