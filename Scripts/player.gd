extends KinematicBody2D


# Declare member variables here. Examples:
var direction = Vector2()
var speed = 3
var vida = 1000
var points = 0
var fogo = preload("res://cena/fogo.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _process(delta):
   if Input.is_key_pressed(KEY_RIGHT):
		   direction.x = speed
   elif Input.is_key_pressed(KEY_LEFT):
		   direction.x = -speed
   else:
		   direction.x = 0
		   
   if Input.is_key_pressed(KEY_UP):
		   direction.y = -speed
   elif Input.is_key_pressed(KEY_DOWN):
		   direction.y = speed
   else:
		   direction.y = 0
   if direction.x == 0 and direction.y == 0:
	   $CharacterIdle1.animation = "idle"
   else:
	   $CharacterIdle1.animation = "walk"
   if self.position.x < get_global_mouse_position().x:
		   $CharacterIdle1.flip_h = false
   else:
		   $CharacterIdle1.flip_h = true

		#atirar
   if Input.is_action_just_pressed("shoot"):
		   var newfogo = fogo.instance()
		   newfogo.position = self.position 
		   self.get_parent().add_child(newfogo)
		
 #Barra de vida
   get_parent().get_node("Vida").scale.x = vida/1000000000.0
 
#Barra de pontos
   get_parent().get_node("vida_inimigo").scale.x = points / 10.0
		
		#vida
   if vida <= 0:
	   get_tree().change_scene("res://cena/derrota.tscn")
#Vitória - Fim de jogo
   if points >= 10:
	   get_tree().change_scene("res://cena/vitoria.tscn")

   move_and_collide(direction)
