extends Node2D

func _input(event):
	if event.is_action_pressed("ui_right"):
		$Animations/BillyAnimationPlayer.play("Walk")
