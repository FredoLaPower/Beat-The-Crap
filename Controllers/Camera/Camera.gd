extends Camera2D


export(NodePath) var TARGET
export(int) var TRANSITION_TIME
export(int) var COLLIDER_THICKNESS
export(Vector2) var VIEWPORT
export(Vector2) var LIMITS_MIN
export(Vector2) var LIMITS_MAX

var _areas = {}
var _half_viewport: Vector2 

func _ready() -> void:
	_half_viewport = VIEWPORT / 2
	
	_areas = {
		"ScrollLeft": {
			"callback": "_scroll_left",
			"extents": {"x": COLLIDER_THICKNESS, "y": VIEWPORT.y},
			"position": {"x": COLLIDER_THICKNESS - _half_viewport.x, "y": 0}
		},
		
		"ScrollRight": {
			"callback": "_scroll_right",
			"extents": {"x": COLLIDER_THICKNESS, "y": VIEWPORT.y},
			"position": {"x": _half_viewport.x - COLLIDER_THICKNESS, "y": 0}
		}
	}

func initialize() -> void:
	# Subscribe to Area2Ds and prepare colliders
	for area in _areas:
# warning-ignore:return_value_discarded
		get_node(area).connect("body_entered", self, _areas[area].callback)
		get_node(area + "/Collider").get_shape().set_extents(Vector2(_areas[area].extents.x, _areas[area].extents.y))
		get_node(area + "/Collider").position = Vector2(_areas[area].position.x, _areas[area].position.y)
	
	if get_node(TARGET).position.x - _half_viewport.x > LIMITS_MIN.x:
		position.x = get_node(TARGET).position.x
	else:
		position.x = LIMITS_MIN.x + _half_viewport.x


func __tween(vector:Vector2) -> void:
	$Tween.interpolate_property(
		self,
		"position",
		position,
		vector,
		TRANSITION_TIME,
		$Tween.TRANS_LINEAR,
		Tween.EASE_IN_OUT
	)
	
	$Tween.start()


func _scroll_left(_body: Node) -> void:
	if position.x  == LIMITS_MIN.x + _half_viewport.x:
		return
	
	if position.x > LIMITS_MIN.x + VIEWPORT.x:
		__tween(Vector2(position.x - _half_viewport.x, position.y))
	else:
		__tween(Vector2(LIMITS_MIN.x + _half_viewport.x, position.y))


func _scroll_right(_body: Node) -> void:
	if position.x + _half_viewport.x == LIMITS_MAX.x:
		return
	
	if position.x < LIMITS_MAX.x - VIEWPORT.x:
		__tween(Vector2(position.x + _half_viewport.x, position.y))
	else:
		__tween(Vector2(LIMITS_MAX.x - _half_viewport.x, position.y))
