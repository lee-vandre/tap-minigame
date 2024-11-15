extends Control

var shotcount= 0;
var stopgame= false
@onready var timer =$Timer

func _process(delta: float) -> void:
	if shotcount ==0 and Input.is_action_just_pressed("ui_accept") and !stopgame :
		timer.start()
		shotcount +=1
		$shotcount.text = str(shotcount)
	elif Input.is_action_just_pressed("ui_accept") and shotcount !=0 and timer and !stopgame :
		shotcount +=1
		$shotcount.text = str(shotcount)

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("reset"):
		get_tree().change_scene_to_file("res://control.tscn")
		
func _on_timer_timeout() -> void:
	stopgame = true
	pass # Replace with function body.
