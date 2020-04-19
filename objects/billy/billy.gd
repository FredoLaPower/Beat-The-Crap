extends "res://Classes/Character.gd"


func _ready():
	# Subscribe to Controller signal
	$Controller.connect("state_changed", self, "_on_Controller_state_changed")
	_character_gravity = owner.GRAVITY
	
	#$Animations/AnimationPlayer.initialize($Controller)
	$Controller.initialize()

func _process(delta):
	$Label.text = "Velocity[%s, %s]" % [velocity.x, velocity.y]

func _on_Controller_state_changed(new_state):
	$State.text = new_state
