extends Node2D



func _ready():
	pass 


func _on_Button_pressed():
	get_tree().change_scene("res://cena/back.tscn")


func _on_Button2_pressed():
	get_tree().quit()
