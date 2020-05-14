#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name StateMachine

extends Node


#------------------------------------------------------------
# SIGNALS
#------------------------------------------------------------

signal state_changed(new_state)


#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

#------------------------------
# EXPORT
#------------------------------

export(String) var START_STATE


#------------------------------
# PRIVATE
#------------------------------

var _current_state: String = ""
var _states = {} # No static typing for dictionary
var _pushdown = [] # Use to store the hierachy of states


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# VIRTUAL
#------------------------------

func initialize() -> void:
	# Subscribe to state signals and initialize states
	for child in get_children():
		child.connect("finished", self, "__change_state")
		child.initialize()
		
		_states[child.get_name()] = child
	
	# Initialize state machine
	__change_state(START_STATE)


# Process the current state logic
func _physics_process(delta: float) -> void:
	_states[_pushdown[0]].update(delta)


# Forward input to the current state
func _unhandled_input(event: InputEvent) -> void:
	_states[_pushdown[0]].handle_input(event)


#------------------------------
# PRIVATE
#------------------------------

func __add_state(state_name: String, state_node: Node) -> void:
	_states[state_name] = state_node


# Manage state machine logic
func __change_state(new_state: String, is_sub_state: bool = false) -> void:
	# Avoid infinite loop at startup
	if new_state == _current_state:
		return
	
	# Exit current state
	if ! is_sub_state && _pushdown.size() > 0:
		_states[_current_state].exit()
		_pushdown.pop_front()
	
	# Return to previous state
	if new_state == "Previous":
		new_state = _pushdown[0]
	else:
		_pushdown.push_front(new_state)
	
	# Enter new state
	_current_state = new_state
	_states[new_state].enter()
	
	# Broadcast change of state
	emit_signal("state_changed", _current_state)


# Initialize the state machine
func __initialize() -> void:
	pass


#------------------------------
# PUBLIC
#------------------------------

# Return the current state
func get_state() -> String:
	return _current_state


# Return the state machine stack
func get_pushdown() -> Array:
	return _pushdown
