#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name PlayerStateMachine

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
var _state_dictionary = {} # No static typing for dictionary
var _states_stack = [] # Use to store the hierachy of states
var _is_paused: bool = false

# Input Manager
var _input_dictionary = {} # [input_name, state, value]
var _input_history = [] # [input_name, timestamp]


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# VIRTUAL
#------------------------------

# Process the current state logic
func _physics_process(delta: float) -> void:
	_state_dictionary[_states_stack[0]].update(delta)


# Forward input to the current state
func _input(event: InputEvent) -> void:
		_state_dictionary[_states_stack[0]].handle_input(event)


#------------------------------
# PRIVATE
#------------------------------
# Add a new state to the state machine
func __add_state(state_name: String, state_node: Node) -> void:
	_state_dictionary[state_name] = state_node


# Manage state machine logic
func __change_state(new_state: String, is_sub_state: bool = false) -> void:
	#Avoid infinite loop at startup or pause
	if new_state == _current_state:
		return
	
	#Exit previous state
	if ! is_sub_state && _states_stack.size() > 0:
		_state_dictionary[_current_state].exit()
		_states_stack.pop_front()
	
	# Return to previous state
	if new_state == "Previous":
		new_state = _states_stack[0]
	else:
		_states_stack.push_front(new_state)
	
	# Enter new state
	_current_state = new_state
	_state_dictionary[new_state].enter()
	
	# Broadcast change of state
	emit_signal("state_changed", _current_state)


func __listen_input(input_name: String) -> void:
	_input_dictionary[input_name] = {"state": "", "value": 0}


func __track_input() -> void:
	pass


func __debug(type: String, trace: String = "") -> void:
	if (type == "fsm"):
		print("trace = %s | _current_state = %s | _states_stack = %s" % [trace, _current_state, _states_stack])
	elif (type == "input"):
		print("trace = %s | _input_dictionary = %s | _input_history = %s" % [trace, _input_dictionary, _input_history])


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


func is_paused() -> bool:
	return _is_paused


func pause(value: bool) -> void:
	_is_paused = value
	
	set_physics_process(!value)
	set_process_input(!value)


func input_is_pressed() -> void:
	pass


func input_is_released() -> void:
	pass


func get_input_value() -> void:
	pass
