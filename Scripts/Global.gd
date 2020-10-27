extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var head := 0
var body := 0
var legs := 0

var run := false
var child := false

const save_path = "user://save.dat"

func _ready():
	load_data()

func _process(delta):
	if child and head > 4:
		head = 0
		

func changeHead(direction):
	head += direction
	if !child:
		if head > 10:
			head = 0
		if head < 0:
			head = 10
			
	else:
		if head > 4:
			head = 0
		if head < 0:
			head = 4

func changeBody(direction):
	if child:
		return
	body += direction
	if body > 7:
		body = 0
	if body < 0:
		body = 7
	
	
func changeLegs(direction):
	legs += direction
	if legs > 2:
		legs = 0
	if legs < 0:
		legs = 2
		
func save_data():
	var data = {
		"head": head,
		"body": body,
		"legs": legs,
		"run": run,
		"child": child,
	}
	
	var file = File.new()
	var error = file.open(save_path, File.WRITE)
	if error == OK:
		file.store_var(data)
		file.close()
	
func load_data():
	var file = File.new()
	if file.file_exists(save_path):
		var error = file.open(save_path, File.READ)
		if error == OK:
			var data = file.get_var()
			file.close()
		
			head = data['head']
			body = data['body']
			legs = data['legs']
			run = data['run']
			child = data['child']
