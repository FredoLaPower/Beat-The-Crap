extends "res://Classes/Objects/Kinematic/NonPlayer.gd"


func _ready() -> void:
	Flags.add_flag("is_looking_left", false)
	Flags.add_flag("is_on_floor", true)
	Flags.add_flag("is_in_motion", false)
	
	Automaton.initialize()


func take_damage(damage: int) -> void:
	_current_health -= damage
	
	Animations.stop()
	Animations.play("Hurt_1")
