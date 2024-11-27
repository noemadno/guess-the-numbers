extends Node2D

@onready var num_1: Label = $CanvasLayer/Panel/HBoxContainer/VBoxContainer/HBoxContainer/num1
@onready var num_2: Label = $CanvasLayer/Panel/HBoxContainer/VBoxContainer/HBoxContainer/num2
@onready var num_3: Label = $CanvasLayer/Panel/HBoxContainer/VBoxContainer/HBoxContainer/num3
@onready var num_4: Label = $CanvasLayer/Panel/HBoxContainer/VBoxContainer/HBoxContainer/num4
@onready var golden_box: AnimatedSprite2D = $"Golden Box"

var guesses = []
var rand_1
var rand_2
var rand_3
var rand_4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	random_number()	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if guesses.size() < 5:
		num_display()


func num_display():
	if guesses.size() > 0:
		num_1.text = guesses[0]
	if guesses.size() > 1:
		num_2.text = guesses[1]
	if guesses.size() > 2:
		num_3.text = guesses[2]
	if guesses.size() > 3:
		num_4.text = guesses[3]


func random_number():
	randomize()
	rand_1 = str(randi_range(1, 9))
	rand_2 = str(randi_range(1, 9))
	rand_3 = str(randi_range(1, 9))
	rand_4 = str(randi_range(1, 9))
	

func check_numbers():
	if rand_1 == guesses[0]:
		num_1.add_theme_color_override("font_color", Color(0, 1, 0))
	if rand_2 == guesses[1]:
		num_2.add_theme_color_override("font_color", Color(0, 1, 0))
	if rand_3 == guesses[2]:
		num_3.add_theme_color_override("font_color", Color(0, 1, 0))
	if rand_4 == guesses[3]:
		num_4.add_theme_color_override("font_color", Color(0, 1, 0))
	
	if rand_1 == guesses[0] and rand_2 == guesses[1] and rand_3 == guesses[2] and rand_4 == guesses[3]:
		golden_box.play("open")
		disable_all_buttons(self)
		await get_tree().create_timer(4).timeout
		get_tree().reload_current_scene()


func disable_all_buttons(node: Node):
	if node is Button:
		node.disabled = true  
	for child in node.get_children():
		disable_all_buttons(child)


func _on_button_1_pressed() -> void:
	if guesses.size() < 5:
		guesses.append("1")


func _on_button_2_pressed() -> void:
	if guesses.size() < 5:
		guesses.append("2")


func _on_button_3_pressed() -> void:
	if guesses.size() < 5:
		guesses.append("3")


func _on_button_4_pressed() -> void:
	if guesses.size() < 5:
		guesses.append("4")


func _on_button_5_pressed() -> void:
	if guesses.size() < 5:
		guesses.append("5")


func _on_button_6_pressed() -> void:
	if guesses.size() < 5:
		guesses.append("6")


func _on_button_7_pressed() -> void:
	if guesses.size() < 5:
		guesses.append("7")


func _on_button_8_pressed() -> void:
	if guesses.size() < 5:
		guesses.append("8")


func _on_button_9_pressed() -> void:
	if guesses.size() < 5:
		guesses.append("9")


func _on_reset_pressed() -> void:
	guesses.clear()
	num_1.text = "-"
	num_2.text = "-"
	num_3.text = "-"
	num_4.text = "-"
	num_1.add_theme_color_override("font_color", Color(1, 1, 1))
	num_2.add_theme_color_override("font_color", Color(1, 1, 1))
	num_3.add_theme_color_override("font_color", Color(1, 1, 1))
	num_4.add_theme_color_override("font_color", Color(1, 1, 1))


func _on_guess_pressed() -> void:
	if guesses.size() == 4:
		check_numbers()
