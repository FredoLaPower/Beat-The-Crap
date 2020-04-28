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
var _states_stack = [] # Use to store the hierachy of states
var _is_paused: bool = false

# Input Manager
var _inputs = {} # [input_name, sid, sum]
var _inputs_stack: Array = [] # [input_name, timestamp] only pressed inputs are tracked | removed released for now
var _inputs_max_entries: int = 10
var _inputs_checksum: String = ""
var _inputs_trace: int = 500 #we track the last 500ms


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# VIRTUAL
#------------------------------

# Process the current state logic
func _physics_process(delta: float) -> void:
	_states[_states_stack[0]].update(delta)


# Forward input to the current state
func _unhandled_input(event: InputEvent) -> void:
	__log_input(event)
	__encode_inputs_stack()
	
	_states[_states_stack[0]].handle_input(event)
	
	


#------------------------------
# PRIVATE
#------------------------------
# Add a new state to the state machine
func __add_state(state_name: String, state_node: Node) -> void:
	_states[state_name] = state_node


# Manage state machine logic
func __change_state(new_state: String, is_sub_state: bool = false) -> void:
	#Avoid infinite loop at startup or pause
	if new_state == _current_state:
		return
	
	#Exit previous state
	if ! is_sub_state && _states_stack.size() > 0:
		_states[_current_state].exit()
		_states_stack.pop_front()
	
	# Return to previous state
	if new_state == "Previous":
		new_state = _states_stack[0]
	else:
		_states_stack.push_front(new_state)
	
	# Enter new state
	_current_state = new_state
	_states[new_state].enter()
	
	# Broadcast change of state
	emit_signal("state_changed", _current_state)


func __add_input(name: String, code: String) -> void:
	_inputs[name] = code


func __log_input(event:InputEvent) -> void:
	for input in _inputs:
		if event.is_action_pressed(input):
			_inputs_stack.push_back([input, OS.get_ticks_msec()])
	
	if _inputs_stack.size() > _inputs_max_entries:
		_inputs_stack.pop_front()


func __encode_inputs_stack() -> void:
	var time_elapsed = OS.get_ticks_msec()
	
	_inputs_checksum = ""
	
	for input in _inputs_stack:
		if time_elapsed - input[1] < _inputs_trace:
			_inputs_checksum += _inputs[input[0]]


#------------------------------
# PUBLIC
#------------------------------
# Initialize the state machine
func initialize() -> void:
	# Subscribe to state signals and initialize states
	for child in get_children():
		child.connect("finished", self, "__change_state")
		child.initialize()
	
	# Initialize state machine
	__change_state(START_STATE)


# Return the current state
func get_state() -> String:
	return _current_state


# Return the state machine stack
func get_states_stack() -> Array:
	return _states_stack


func get_encoded_inputs() -> String:
	return _inputs_checksum


func is_paused() -> bool:
	return _is_paused


func pause(value: bool) -> void:
	_is_paused = value
	
	set_physics_process(!value)
	set_process_input(!value)
