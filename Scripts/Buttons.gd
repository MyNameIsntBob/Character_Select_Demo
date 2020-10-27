extends HBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(String) var buttonName
signal change(direction)
# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = buttonName
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_left_pressed():
	emit_signal("change", -1)
	pass # Replace with function body.


func _on_right_pressed():
	emit_signal("change", 1)
	pass # Replace with function body.
