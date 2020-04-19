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
export(NodePath) var ANIMATION_PLAYER
export(NodePath) var SPRITE_SHEET


#------------------------------
# PRIVATE
#------------------------------
var _current_state: String = ""
var _state_dictionary = {} # No static typing for dictionary
var _states_stack = [] # Use to store the hierachy of states
var _is_in_debug_mode: bool = false
var _is_paused: bool = false

# Input Manager

var _input_dictionary = {} # [input_name, state, value]
var _input_history = [] # [input_name, timestamp]

#------------------------------
# PUBLIC
#------------------------------
var AnimPlayer: Node
var SpriteSheet: Node


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# VIRTUAL
#------------------------------

# Process the current state logic
func _process(delta):
	_state_dictionary[_states_stack[0]].update(delta)


# Forward input to the current state
func _input(event):	
	_state_dictionary[_states_stack[0]].handle_input(event)


#------------------------------
# PRIVATE
#------------------------------
# Add a new state to the state machine
func __add_state(state_name: String, state_node: Node):
	_state_dictionary[state_name] = state_node


# Manage state machine logic
func __change_state(new_state: String, is_sub_state: bool = false):
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
	
	if _is_in_debug_mode:
		__debug("fsm", new_state)


func __listen_input(input_name: String):
	_input_dictionary[input_name] = {"state": "", "value": 0}


func __track_input():
	pass


func __debug(type: String, trace: String = ""):
	if (type == "fsm"):
		print("trace = %s | _current_state = %s | _states_stack = %s" % [trace, _current_state, _states_stack])
	elif (type == "input"):
		print("trace = %s | _input_dictionary = %s | _input_history = %s" % [trace, _input_dictionary, _input_history])


#------------------------------
# PUBLIC
#------------------------------
# Initialize the state machine
func initialize():
	# Store animation and sprite nodes
	AnimPlayer = get_node(ANIMATION_PLAYER)
	SpriteSheet = get_node(SPRITE_SHEET)
	
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


func pause():
	_is_paused = true
	
	set_physics_process(false)
	set_process_input(false)


func _unpause():
	_is_paused = false
	
	set_physics_process(true)
	set_process_input(true)


func input_is_pressed():
	pass


func input_is_released():
	pass


func get_input_value():
	pass
