extends Control

var val  = 0.5
var shotcount= 0;
var stopgame= false
@onready var shotcount_label = $shotcount
@onready var timer =$Timer
@onready var speed_container = $subviewcontainer
@onready var speed_sound = $speedsound
var line_opacity = 0.0

func _ready() -> void:
	shotcount_label.label_settings.font_size = 16
	speed_container.material.set_shader_parameter("center_radius", 0.0)
	
func _process(delta: float) -> void:
	val += 0.02
	if val > 1.0:
		val = 0.5
	speed_container.material.set_shader_parameter("sample_radius", val)
	if Input.is_action_just_pressed("invalid"):
		stopgame = true
	if shotcount ==0 and (Input.is_action_just_pressed("altbtn2")) and !stopgame :
		timer.start()
		shotcount +=1
		$shotcount.text = str(shotcount)
		speed_sound.play()
	elif (Input.is_action_just_pressed("altbtn2") ) and shotcount !=0 and timer and !stopgame :
		shotcount +=1
		$shotcount.text = str(shotcount)
		line_opacity+= 0.01
		speed_container.material.set_shader_parameter("center_radius", line_opacity)
		speed_sound.volume_db +=0.9
		shotcount_label.label_settings.font_size += 1

func _input(event: InputEvent) -> void:

	if Input.is_action_just_pressed("reset"):
		get_tree().change_scene_to_file("res://control.tscn")
		
func _on_timer_timeout() -> void:
	stopgame = true
	speed_sound.playing = false
	var file =FileAccess.open("res://scores.txt",FileAccess.READ)
	var line = file.get_line()
	var splitline =line.split(",")
	var name = splitline[0]
	var score = splitline[1].to_int()/5
	$ding.play()
	pass # Replace with function body.
