extends KinematicBody2D


var player
var speed = 3

# Chamado quando o nó entra na árvore de cena pela primeira vez.
func _ready():
	player = get_parent().get_node("player")

# Chamado a cada quadro. 'delta' é o tempo decorrido desde o quadro anterior.
func _process(delta):
	var distancia_para_jogador = position.distance_to(player.position)
	if distancia_para_jogador > 75:
		var direcao = (player.position - position).normalized()  # Obtém a direção para o jogador
		move_and_collide(direcao * speed * delta)  # Move em direção ao jogador com velocidade ajustada para delta
	
