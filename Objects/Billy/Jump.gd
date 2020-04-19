extends "res://Classes/State.gd"

var _start_position_y: float = 0

func enter():
	get_node(ANIMATION_PLAYER).play("Jump")
	_start_position_y = owner.position.y
	owner.velocity.y = -owner.JUMP_FORCE


func update(delta):
	owner.velocity.y += Constants.GRAVITY * delta
	
	if owner.position.y > _start_position_y:
		owner.position.y = _start_position_y
		owner.velocity = Vector2.ZERO
		emit_signal("finished", "Previous")
