extends Node

export (PackedScene) var Mob
var score

func _ready():
	randomize()
	
func new_game():
	score = 0
	$Player.start($StartPos.position)
	$StartTimer.start()