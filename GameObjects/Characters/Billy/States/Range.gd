extends Area2D


func _on_Range_body_entered(body):
	body.add_threat(owner.get_instance_id())


func _on_Range_body_exited(body):
	body.remove_threat(owner.get_instance_id())
