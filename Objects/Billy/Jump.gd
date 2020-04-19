extends "res://Classes/State.gd"

func initialize():
	get_parent().AnimationPlayer.connect("animation_finished", self, "_on_animation_finished")


func enter():
	get_parent().AnimationPlayer.play("Jump")
	owner.velocity.y = -owner.JUMP_FORCE

func update(delta):
	owner.velocity.y += owner.get_gravity() * delta
	
	

#func _on_animation_finished(anim_name):
#	if anim_name == "Jump":
#		emit_signal("finished", "Previous")
