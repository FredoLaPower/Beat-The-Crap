extends "res://Classes/StateMachine/State.gd"


var _start_position: float = 0
var _start_time: float = 0
var _is_kicking: bool = false
var _max_time: int = 600

func enter() -> void:
	_is_kicking = false
	_start_time = OS.get_ticks_msec()
	_start_position = owner.Pivot.position.y
	owner.Pivot.velocity.y = -owner.JUMP_FORCE
	
	owner.Flags.set_flag("is_in_motion", true)
	owner.Flags.set_flag("is_on_floor", false)
	
	owner.Animations.play("Jump")


# warning-ignore:unused_argument
func update(delta: float) -> void:
	if owner.Pivot.position.y >= _start_position:
		owner.Pivot.position.y = _start_position
		owner.Pivot.velocity = Vector2.ZERO
			
		owner.Flags.set_flag("is_on_floor", true)
		
		emit_signal("finished", "Previous")


func handle_input(event) -> void:
	if !_is_kicking && OS.get_ticks_msec() - _start_time < _max_time && event.is_action_pressed("Kick"):
		_is_kicking = true
		
		owner.Animations.play("Flying_kick")
