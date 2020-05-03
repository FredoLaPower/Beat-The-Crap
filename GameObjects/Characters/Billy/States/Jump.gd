extends "res://Classes/State.gd"


var _start_position_y: float = 0
var _start_time: float = 0
var _is_kicking: bool = false
var _max_time: int = 600

func enter() -> void:
	_is_kicking = false
	_start_time = OS.get_ticks_msec()
	_start_position_y = owner.get_node("Container").position.y
	owner.get_node("Container").velocity.y = -owner.JUMP_FORCE
	
	owner.set_flag("is_in_motion", true)
	owner.set_flag("is_on_floor", false)
	owner.get_node("Managers/Animation").play("Jump")


# warning-ignore:unused_argument
func update(delta: float) -> void:
	if owner.get_node("Container").position.y >= _start_position_y:
		owner.get_node("Container").position.y = _start_position_y
		owner.get_node("Container").velocity = Vector2.ZERO
			
		owner.set_flag("is_on_floor", true)
		
		emit_signal("finished", "Previous")


func handle_input(event) -> void:
	if !_is_kicking && OS.get_ticks_msec() - _start_time < _max_time && event.is_action_pressed("Kick"):
		_is_kicking = true
		
		owner.get_node("Managers/Animation").play("Flying_kick")
