extends Area2D


func _on_Range_body_entered(body) -> void:
	body.add_threat(owner.get_instance_id())
	call_deferred("owner.enable_hitbox")

func _on_Range_body_exited(body) -> void:
	if is_queued_for_deletion():
		body.remove_threat(owner.get_instance_id())
		call_deferred("owner.disable_hitbox")
