extends Node2D
####### NOTES ########
# This is an area to write down the work I want to do next time I log in
#
#FIX OPENING TRANSITION RAHHHHHHHHHHHHHHHHHH
#
#
#
#
#
#
#
#
#
#
#

# -------VARIABLES-------

# Checks if escape was pressed during the opening 
var menu_passed = false

# Checks if the difficulty buttons are hidden
var diff_hidden = true

# Checks if the round buttons are hidden
var rounds_hidden = true

# Checks if we are off the opening
var opening = true

# Checks the difficulty value. Easy = 1. Normal = 2. Hard = 3.
var difficulty = 0 

# Checks the number of rounds Unlimited = 10. 
var rounds = 0

# Checks the screen you are on so that the back button takes you one screen back Main Menu = 0. Difficulty = 1. Rounds = 2. Settings = 3. Audio Settings = 4. Screen Settings = 5. Credits = 6. 
var screen = 0 

# -------PLAY BUTTON LOGIC-------
func _on_button_mouse_entered() -> void:
	$PlayButton.icon = ResourceLoader.load("res://Assets/Art/Menu/Non-Rounds/Play_B2.png")
	$Audio/ButtonHover.play()

func _on_button_mouse_exited() -> void:
	$PlayButton.icon = ResourceLoader.load("res://Assets/Art/Menu/Non-Rounds/Play_B1.png")
	
func _on_play_button_pressed() -> void:
	$Audio/ButtonClick.play()
	hide_menu()
	show_diff()
	screen = 1

# -------SETTINGS BUTTON LOGIC-------
func _on_settings_button_mouse_entered() -> void:
	$SettingsButton.icon = ResourceLoader.load("res://Assets/Art/Menu/Non-Rounds/Settings_B2.png")
	$Audio/ButtonHover.play()

func _on_settings_button_mouse_exited() -> void:
	$SettingsButton.icon = ResourceLoader.load("res://Assets/Art/Menu/Non-Rounds/Settings_B1.png")
	
func _on_settings_button_pressed() -> void:
	$Audio/ButtonClick.play()
	$PlayButton.visible = false
	$SettingsButton.visible = false
	$BackButton.visible = true
	$QuitButton.visible = false
	$CupsRedMenu.visible = false
	screen = 3

# -------QUIT BUTTON LOGIC-------
func _on_quit_button_mouse_entered() -> void:
	$QuitButton.icon = ResourceLoader.load("res://Assets/Art/Menu/Non-Rounds/Quit_B2.png")
	$Audio/ButtonHover.play()

func _on_quit_button_mouse_exited() -> void:
	$QuitButton.icon = ResourceLoader.load("res://Assets/Art/Menu/Non-Rounds/Quit_B1.png")


func _on_quit_button_pressed() -> void:
	get_tree().quit()
	
# -------EASY BUTTON SETTINGS -------
func _on_easy_button_mouse_entered() -> void:
	$Difficulty_Buttons/EasyButton.icon = ResourceLoader.load("res://Assets/Art/Menu/Non-Rounds/Easy_B2.png")
	$Audio/ButtonHover.play()
	
func _on_easy_button_mouse_exited() -> void:
	$Difficulty_Buttons/EasyButton.icon = ResourceLoader.load("res://Assets/Art/Menu/Non-Rounds/Easy_B1.png")

func _on_easy_button_pressed() -> void:
	difficulty = 1
	to_diff_screen()

# -------NORMAL BUTTON SETTINGS -------
func _on_normal_button_mouse_entered() -> void:
	$Difficulty_Buttons/NormalButton.icon = ResourceLoader.load("res://Assets/Art/Menu/Non-Rounds/Normal_B2.png")
	$Audio/ButtonHover.play()
	
func _on_normal_button_mouse_exited() -> void:
	$Difficulty_Buttons/NormalButton.icon = ResourceLoader.load("res://Assets/Art/Menu/Non-Rounds/Normal_B1.png")
	
func _on_normal_button_pressed() -> void:
	difficulty = 2
	to_diff_screen()

# -------HARD BUTTON SETTINGS -------
func _on_hard_button_mouse_entered() -> void:
	$Difficulty_Buttons/HardButton.icon = ResourceLoader.load("res://Assets/Art/Menu/Non-Rounds/Hard_B2.png")
	$Audio/ButtonHover.play()
	
func _on_hard_button_mouse_exited() -> void:
	$Difficulty_Buttons/HardButton.icon = ResourceLoader.load("res://Assets/Art/Menu/Non-Rounds/Hard_B1.png")
	
func _on_hard_button_pressed() -> void:
	difficulty = 3
	to_diff_screen()

# -------BACK BUTTON LOGIC-------
func _on_back_button_mouse_entered() -> void:
	$BackButton.icon = ResourceLoader.load("res://Assets/Art/Menu/Non-Rounds/Back_B2.png")
	$Audio/ButtonHover.play()

func _on_back_button_mouse_exited() -> void:
	$BackButton.icon = ResourceLoader.load("res://Assets/Art/Menu/Non-Rounds/Back_B1.png")
	
func _on_back_button_pressed() -> void:
	if screen == 1 or screen == 3 or screen == 6:
		show_menu()
		$CupsRedMenu.visible = true
	$Audio/ButtonClick.play()
	if rounds_hidden == false:
		hide_rounds()
	if diff_hidden == false:
		hide_diff()
	
	# Back to difficuly from rounds 
	if screen == 2:
		screen = 1
		hide_rounds()
		show_diff()
		$CupsRedMenu.visible = true

# -------ROUND ONE BUTTON LOGIC-------
func _on_round_1_button_mouse_entered() -> void:
	$Round_Buttons/Round1Button.icon = ResourceLoader.load("res://Assets/Art/Menu/Rounds/One_Round_B2.png")
	$Audio/ButtonHover.play()

func _on_round_1_button_mouse_exited() -> void:
	$Round_Buttons/Round1Button.icon = ResourceLoader.load("res://Assets/Art/Menu/Rounds/One_Round_B1.png")

func _on_round_1_button_pressed() -> void:
	rounds = 1
	to_game_scene()

# -------ROUND TWO BUTTON LOGIC-------
func _on_round_2_button_mouse_entered() -> void:
	$Round_Buttons/Round2Button.icon = ResourceLoader.load("res://Assets/Art/Menu/Rounds/Two_Round_B2.png")
	$Audio/ButtonHover.play()

func _on_round_2_button_mouse_exited() -> void:
	$Round_Buttons/Round2Button.icon = ResourceLoader.load("res://Assets/Art/Menu/Rounds/Two_Round_B1.png")

func _on_round_2_button_pressed() -> void:
	rounds = 2
	get_tree().change_scene_to_file("res://Scenes/main_game.tscn")
	
# -------ROUND THREE BUTTON LOGIC-------
func _on_round_3_button_mouse_entered() -> void:
	$Round_Buttons/Round3Button.icon = ResourceLoader.load("res://Assets/Art/Menu/Rounds/Three_Round_B2.png")
	$Audio/ButtonHover.play()

func _on_round_3_button_mouse_exited() -> void:
	$Round_Buttons/Round3Button.icon = ResourceLoader.load("res://Assets/Art/Menu/Rounds/Three_Round_B1.png")

func _on_round_3_button_pressed() -> void:
	rounds = 3
	get_tree().change_scene_to_file("res://Scenes/main_game.tscn")

# -------ROUND FOUR BUTTON LOGIC-------
func _on_round_4_button_mouse_entered() -> void:
	$Round_Buttons/Round4Button.icon = ResourceLoader.load("res://Assets/Art/Menu/Rounds/Four_Round_B2.png")
	$Audio/ButtonHover.play()

func _on_round_4_button_mouse_exited() -> void:
	$Round_Buttons/Round4Button.icon = ResourceLoader.load("res://Assets/Art/Menu/Rounds/Four_Round_B1.png")

func _on_round_4_button_pressed() -> void:
	rounds = 4
	get_tree().change_scene_to_file("res://Scenes/main_game.tscn")

# -------ROUND FIVE BUTTON LOGIC-------
func _on_round_5_button_mouse_entered() -> void:
	$Round_Buttons/Round5Button.icon = ResourceLoader.load("res://Assets/Art/Menu/Rounds/Five_Round_B2.png")
	$Audio/ButtonHover.play()

func _on_round_5_button_mouse_exited() -> void:
	$Round_Buttons/Round5Button.icon = ResourceLoader.load("res://Assets/Art/Menu/Rounds/Five_Round_B1.png")

func _on_round_5_button_pressed() -> void:
	rounds = 5
	get_tree().change_scene_to_file("res://Scenes/main_game.tscn")

# -------ROUND SIX BUTTON LOGIC-------
func _on_round_6_button_mouse_entered() -> void:
	$Round_Buttons/Round6Button.icon = ResourceLoader.load("res://Assets/Art/Menu/Rounds/Six_Round_B2.png")
	$Audio/ButtonHover.play()

func _on_round_6_button_mouse_exited() -> void:
	$Round_Buttons/Round6Button.icon = ResourceLoader.load("res://Assets/Art/Menu/Rounds/Six_Round_B1.png")

func _on_round_6_button_pressed() -> void:
	rounds = 6
	get_tree().change_scene_to_file("res://Scenes/main_game.tscn")

# -------ROUND SEVEN BUTTON LOGIC-------
func _on_round_7_button_mouse_entered() -> void:
	$Round_Buttons/Round7Button.icon = ResourceLoader.load("res://Assets/Art/Menu/Rounds/Seven_Round_B2.png")
	$Audio/ButtonHover.play()

func _on_round_7_button_mouse_exited() -> void:
	$Round_Buttons/Round7Button.icon = ResourceLoader.load("res://Assets/Art/Menu/Rounds/Seven_Round_B1.png")

func _on_round_7_button_pressed() -> void:
	rounds = 7
	get_tree().change_scene_to_file("res://Scenes/main_game.tscn")

# -------ROUND EIGHT BUTTON LOGIC-------
func _on_round_8_button_mouse_entered() -> void:
	$Round_Buttons/Round8Button.icon = ResourceLoader.load("res://Assets/Art/Menu/Rounds/Eight_Round_B2.png")
	$Audio/ButtonHover.play()

func _on_round_8_button_mouse_exited() -> void:
	$Round_Buttons/Round8Button.icon = ResourceLoader.load("res://Assets/Art/Menu/Rounds/Eight_Round_B1.png")

func _on_round_8_button_pressed() -> void:
	rounds = 8
	get_tree().change_scene_to_file("res://Scenes/main_game.tscn")

# -------ROUND NINE BUTTON LOGIC-------
func _on_round_9_button_mouse_entered() -> void:
	$Round_Buttons/Round9Button.icon = ResourceLoader.load("res://Assets/Art/Menu/Rounds/Nine_Round_B2.png")
	$Audio/ButtonHover.play()

func _on_round_9_button_mouse_exited() -> void:
	$Round_Buttons/Round9Button.icon = ResourceLoader.load("res://Assets/Art/Menu/Rounds/Nine_Round_B1.png")

func _on_round_9_button_pressed() -> void:
	rounds = 9
	get_tree().change_scene_to_file("res://Scenes/main_game.tscn")

# -------ROUND UNLIMITED BUTTON LOGIC-------
func _on_unlimited_round_button_mouse_entered() -> void:
	$Round_Buttons/UnlimitedRoundButton.icon = ResourceLoader.load("res://Assets/Art/Menu/Rounds/Unlimited_Round_B2.png")
	$Audio/ButtonHover.play()

func _on_unlimited_round_button_mouse_exited() -> void:
	$Round_Buttons/UnlimitedRoundButton.icon = ResourceLoader.load("res://Assets/Art/Menu/Rounds/Unlimited_Round_B1.png")

func _on_unlimited_round_button_pressed() -> void:
	rounds = 9223372036854775807
	get_tree().change_scene_to_file("res://Scenes/main_game.tscn")

# ------- FUNCTIONS -------

# ------- TRANSITION FUNCTIONS -------
func _on_canvas_layer_transition() -> void:
	if opening == true:
		$DaveGuyProductionsSs.visible = false
		$CanvasLayer/ColorRect.visible = false
		$Audio/Menu_Music.play()
		menu_passed = true
		opening = false

func _input(event): 
	if event.is_action_pressed("ui_cancel") and menu_passed == false:
		$DaveGuyProductionsSs.visible = false
		$CanvasLayer/ColorRect.visible = false
		$Audio/Menu_Music.play()
		$Audio/DaveGuyFanfare2.stop()
		menu_passed = true

func to_game_scene():
	get_node("CanvasLayer").fade_to_black()
	

#------- BUTTON VISIBILITY FUNCTIONS -------
func show_rounds():
	$Round_Buttons/Round1Button.visible = true
	$Round_Buttons/Round2Button.visible = true
	$Round_Buttons/Round3Button.visible = true
	$Round_Buttons/Round4Button.visible = true
	$Round_Buttons/Round5Button.visible = true
	$Round_Buttons/Round6Button.visible = true
	$Round_Buttons/Round7Button.visible = true
	$Round_Buttons/Round8Button.visible = true
	$Round_Buttons/Round9Button.visible = true
	$Round_Buttons/UnlimitedRoundButton.visible = true
	rounds_hidden = false

func hide_rounds():
	$Round_Buttons/Round1Button.visible = false
	$Round_Buttons/Round2Button.visible = false
	$Round_Buttons/Round3Button.visible = false
	$Round_Buttons/Round4Button.visible = false
	$Round_Buttons/Round5Button.visible = false
	$Round_Buttons/Round6Button.visible = false
	$Round_Buttons/Round7Button.visible = false
	$Round_Buttons/Round8Button.visible = false
	$Round_Buttons/Round9Button.visible = false
	$Round_Buttons/UnlimitedRoundButton.visible = false
	rounds_hidden = true

func show_diff():
	$Difficulty_Buttons/EasyButton.visible = true
	$Difficulty_Buttons/NormalButton.visible = true
	$Difficulty_Buttons/HardButton.visible = true
	diff_hidden = false

func hide_diff():
	$Difficulty_Buttons/EasyButton.visible = false
	$Difficulty_Buttons/NormalButton.visible = false
	$Difficulty_Buttons/HardButton.visible = false
	diff_hidden = true

func show_menu():
	$PlayButton.visible = true
	$SettingsButton.visible = true
	$QuitButton.visible = true 
	$BackButton.visible = false
	screen = 0

func hide_menu():
	$PlayButton.visible = false
	$SettingsButton.visible = false
	$QuitButton.visible = false
	$BackButton.visible = true
	
func to_diff_screen():
	screen = 2
	hide_diff()
	show_rounds()
	$CupsRedMenu.visible = false
	$Audio/ButtonClick.play()
	
