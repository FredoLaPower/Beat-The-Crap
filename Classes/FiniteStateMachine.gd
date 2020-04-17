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
var _previous_state: String = ""
var _state_dictionary = {} # No static typing for dictionary
var _states_stack = [] # Use to store the hierachy of states


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
	_state_dictionary[_states_stack[0]].update(delta)


# Forward input to the current state
func _input(event):
	_state_dictionary[_states_stack[0]].input(event)


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
	# Exit previous state
	if _states_stack.size() != 0:
		_state_dictionary[_current_state].exit()
		_states_stack.pop_front()
	
	# Enter new state
	_current_state = new_state
	_states_stack.push_front(new_state)
	_state_dictionary[new_state].enter()
	
	# Broadcast change of state
	emit_signal("state_changed", _current_state)


#------------------------------
# PUBLIC
#------------------------------
func get_state():
	return _current_state

func get_states_stack():
	return _states_stack
