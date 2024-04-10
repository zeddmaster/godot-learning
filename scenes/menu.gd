extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


# Start Game - Loading 1st lvl
func _start_game():
	get_tree().change_scene_to_file("res://scenes/levels/level-1.tscn")

# Quit Game
func _quit_game():
	get_tree().quit()
