extends Camera2D


export(NodePath) var TARGET
export(int) var OFFSET_X
export(int) var TRESHOLD_X
export(int) var VIEWPORT_X


func initialize():
	position.x = get_node(TARGET).position.x + OFFSET_X


func __tween(translation: int):
	$Tween.interpolate_property(
			self,
			"position",
			self.position,
			Vector2(self.position.x + translation, self.position.y),
			1,
			$Tween.TRANS_LINEAR,
			Tween.EASE_IN_OUT
		)
	
	$Tween.start()


func _on_ScrollRight_body_entered(body):
	__tween(VIEWPORT_X - OFFSET_X)


func _on_ScrollLeft_body_entered(body):
	__tween(OFFSET_X - VIEWPORT_X)
