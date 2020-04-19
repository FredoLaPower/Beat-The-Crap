extends "res://Classes/State.gd"

var _start_position_y: float = 0


func initialize():
	get_parent().AnimPlayer.connect("animation_finished", self, "_on_animation_finished")


func enter():
	get_parent().AnimPlayer.play("Jump")
	_start_position_y = owner.position.y
	owner.velocity.y = -owner.JUMP_FORCE


func update(delta):
	owner.velocity.y += owner.get_gravity() * delta
	
	if owner.position.y > _start_position_y:
		owner.position.y = _start_position_y
		owner.velocity = Vector2.ZERO
		emit_signal("finished", "Previous")
