#------------------------------------------------------------
# DECLARATION
#------------------------------------------------------------

class_name MyClass

extends Node # Whatever object or class this class extends


#------------------------------------------------------------
# SIGNALS
#------------------------------------------------------------


#------------------------------------------------------------
# PROPERTIES
#------------------------------------------------------------

# Common writing convention for properties
#     1. Use snake_case for property name
#     2. Use static typing whenever possible

#------------------------------
# EXPORT
#------------------------------
# export(<type>) var MY_VAR

#------------------------------
# PRIVATE
#------------------------------
# Specific writing convention for private properties
#     1. Use _ to prefix a private property

# var _my_private_var: <type> = <default_value>


#------------------------------
# PUBLIC
#------------------------------
# Specific writing convention for public properties
#     1. Use setter and getter whenever needed

# var my_var: String = "" setget set_myvar, get_myvar 


#------------------------------------------------------------
# METHODS
#------------------------------------------------------------

#------------------------------
# VIRTUAL
#------------------------------
# Virtual methods are methods that MUST be overrided in the sub class
# use static typing for parameters
# use static typing for function which returns a value

#func _my_virtual_function():
#	pass


#------------------------------
# PRIVATE
#------------------------------
# use __ to prefix private function
# use static typing for parameters
# use static typing for function which returns a value


#func __my_private_function() -> void:
#	pass

#func __my_private_function() -> void:
#	pass

#------------------------------
# PUBLIC
#------------------------------
