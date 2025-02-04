extends KinematicBody2D

var player
var speed = 3
var angle
var vida = 1

# Chamado quando o nó entra na árvore de cena pela primeira vez.
func _ready():
	player = get_parent().get_node("player")
	

# Chamado a cada quadro. 'delta' é o tempo decorrido desde o quadro anterior.
func _process(_delta):
   angle = get_angle_to(player.position)
   if position.distance_to(player.position) > 75:
		   move_and_collide(Vector2(1,0).rotated(angle)*speed)
   else:
	   if player.vida > 0:
		   player.vida -= 10 
	   queue_free()

#Morrer ao acabar a quantidade de vida
   if vida < 0:
	   if player.points<10:
		   player.points += 1
		   queue_free()
