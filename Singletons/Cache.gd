extends Node

var sound_samples = {}
var game_objects = {}

func preload_resource(type: String, name: String, resource_path: String) -> void:
	match type:
		"sound_sample":
			sound_samples[name] = load(resource_path)
		"game_object":
			game_objects[name] = load(resource_path)
