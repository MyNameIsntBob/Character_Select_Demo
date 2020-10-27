extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var global_vars = get_node("/root/Global")
#player_vars.health -= 10

# Called when the node enters the scene tree for the first time.
func _ready():
	find_node('CheckRun').pressed = global_vars.run
	find_node('CheckChild').pressed = global_vars.child
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	find_node('Body').visible = !global_vars.child


func _on_Head_change(direction):
	global_vars.changeHead(direction)


func _on_Body_change(direction):
	global_vars.changeBody(direction)


func _on_Legs_change(direction):
	global_vars.changeLegs(direction)


func _on_CheckRun_toggled(button_pressed):
	global_vars.run = button_pressed


func _on_CheckChild_toggled(button_pressed):
	global_vars.child = button_pressed


func _on_Save_pressed():
	global_vars.save_data()
