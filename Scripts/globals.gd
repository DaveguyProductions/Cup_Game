extends Node


####### NOTES ########
# This is an area to write down the work I want to do next time I log in
#
#
# Lines 266 - 268 in main_menu.gd could be made into a function inside of that function and the one below it
# Work on audio setting for the game
# Start working on game logic
#
#
# Main menu logic can be improved by making each section a child of a node then hiding the node instead of
# each element. 

# false = in intro, true = in main menu
var game_state = false

# Checks the difficulty value. Easy = 1. Normal = 2. Hard = 3.
var difficulty = 0 

# Checks the balls position. 1 = left cup. 2 = middle cup. 3 = right cup.
var ball_position = 0

# Checks the number of rounds Unlimited = 10. 
var rounds = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
