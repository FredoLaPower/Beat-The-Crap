extends "res://Classes/State.gd"


var _start_position_y: float = 0


func enter() -> void:
	_start_position_y = owner.get_node("Pivot").position.y
	owner.get_node("Pivot").velocity.y = -owner.JUMP_FORCE
	owner.get_node("Pivot").set_physics_process(true)
	
	owner.get_node("Pivot/Animation/AnimationPlayer").play("Jump")


func update(delta: float) -> void:	
	owner.get_node("Pivot").velocity.y += Constants.GRAVITY * delta
	
	if owner.get_node("Pivot").position.y >= _start_position_y:
		owner.get_node("Pivot").position.y = _start_position_y
		owner.get_node("Pivot").velocity = Vector2.ZERO

		emit_signal("finished", "Previous")
