extends Area2D

@onready var starting_color = self.modulate

func _on_body_entered(body):
	$AudioplayerMid.play()
	self.modulate = Color(1.0, 0.0, 0.0, 1.0)

func _on_audioplayer_mid_finished():
	self.modulate = starting_color
