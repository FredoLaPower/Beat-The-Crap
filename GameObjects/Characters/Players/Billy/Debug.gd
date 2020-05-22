extends Label

export(NodePath) var MOVE
export(NodePath) var FLAGS


func _process(_delta):
	text = "vel: %s\nin motion: %s" % [get_node(MOVE).velocity, get_node(FLAGS).get_flag("is_in_motion")]
