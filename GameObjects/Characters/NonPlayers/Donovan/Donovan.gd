extends "res://Classes/Objects/Kinematic/NonPlayer.gd"


func _ready() -> void:
	__add_flag("is_looking_left", false)
	__add_flag("is_on_floor", true)
	__add_flag("is_in_motion", false)


func take_damage(damage: int) -> void:
	_current_health -= damage
	
	$Controllers/Animation.stop()
	$Controllers/Animation.play("Hurt_1")
