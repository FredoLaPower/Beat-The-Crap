extends "res://Classes/State.gd"


var _start_position_y: float = 0
var _time_elapsed: float = 0


func enter() -> void:
	_start_position_y = owner.position.y
	owner.velocity.y = -owner.JUMP_FORCE

	owner.get_node("Pivot/Animation/AnimationPlayer").play("Jump")


func update(delta: float) -> void:	
	owner.velocity.y += Constants.GRAVITY * delta

	if owner.position.y >= _start_position_y:
		owner.position.y = _start_position_y
		owner.velocity = Vector2.ZERO
		emit_signal("finished", "Previous")
