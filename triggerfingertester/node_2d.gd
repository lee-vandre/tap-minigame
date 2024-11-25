extends Node2D

@onready
var highscorelabel =$"../highscore"

func _ready() -> void:
	self.position = get_viewport_rect().size/2
	display_high_score()
	


func display_high_score()-> void:
	var file =FileAccess.open("res://scores.txt",FileAccess.READ)
	var line = file.get_line()
	var splitline =line.split(",")
	var name = splitline[0]
	var score = splitline[1].to_int()/5
	highscorelabel.text="High Score "+ splitline[1]+ " held by : "+name + " with "+ str(score)+" taps per second"
	
