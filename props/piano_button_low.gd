extends Area2D

@onready var starting_color = self.modulate

func _on_body_entered(body):
	$AudioplayerLow.play()
	self.modulate = Color(1.0, 0.0, 0.0, 1.0)
	
func _on_audioplayer_low_finished():
	self.modulate = starting_color
