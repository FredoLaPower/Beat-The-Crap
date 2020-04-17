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
var _state_dictionary = {} # No static typing for dictionary
var _states_stack = [] # Use to store the hierachy of states
var _is_in_debug_mode: bool = false

#------------------------------
# PUBLIC
#------------------------------



#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# VIRTUAL
#------------------------------
func _ready():
#	__add_state("Idle", $Idle)
#	__initialize()
	pass

# Process the current state logic
func _physics_process(delta):
	_state_dictionary[_states_stack[0]].state_update(delta)


# Forward input to the current state
func _input(event):
	_state_dictionary[_states_stack[0]].state_input(event)


#------------------------------
# PRIVATE
#------------------------------
func __initialize():
	# Subscribe to state signals
	for child in get_children():
		child.connect("finished", self, "__change_state")
	
	# Initialize state machine
	__change_state(START_STATE)


func __add_state(state_name: String, state_node_path: Node):
	_state_dictionary[state_name] = state_node_path


func __change_state(new_state: String):
	#Avoid infinite loop at startup
	if new_state == _current_state:
		return
	
	# stack states
	if new_state.find("sub_") != -1:
		new_state = new_state.replace("sub_", "")
	elif _states_stack.size() > 0:
		#Exit previous state
		_state_dictionary[_current_state].state_exit()
		_states_stack.pop_front()
	
	# Return to previous state
	if new_state == "Previous":
		new_state = _states_stack[0]
	else:
		_states_stack.push_front(new_state)
	
	# Enter new state
	_current_state = new_state
	_state_dictionary[new_state].state_enter()
	
	# Broadcast change of state
	emit_signal("state_changed", _current_state)
	
	if _is_in_debug_mode:
		__debug(new_state)

func __debug(trace: String = ""):
	print("trace = %s | _current_state = %s | _states_stack = %s" % [trace, _current_state, _states_stack])
	

#------------------------------
# PUBLIC
#------------------------------
func get_state():
	return _current_state

func get_states_stack():
	return _states_stack
