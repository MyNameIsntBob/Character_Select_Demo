extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var global_vars = get_node("/root/Global")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var character
	if global_vars.child:
		$Adult.visible = false
		$Child.visible = true
		character = $Child
		
		character.get_node("Head").frame_coords.y = global_vars.head + 3
		character.get_node("Legs").frame_coords.y = global_vars.legs + 3
	else:
		$Adult.visible = true
		$Child.visible = false
		character = $Adult
		
		character.get_node("Head").frame_coords.y = global_vars.head + 1
		character.get_node("Body").frame_coords.y = global_vars.body + 1
		character.get_node("Legs").frame_coords.y = global_vars.legs + 1
		
	var ap = character.get_node("AnimationPlayer")
	if global_vars.run and ap.current_animation != 'Run':
		ap.stop()
		ap.play('Run')
	if !global_vars.run and ap.current_animation != 'Idle':
		ap.stop()
		ap.play('Idle')
		
