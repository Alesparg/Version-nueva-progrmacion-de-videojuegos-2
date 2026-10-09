extends AnimatedSprite2D

@onready var mat: ShaderMaterial = material as ShaderMaterial
@export var label_arma: Label

var paleta_actual := 0

var paletas := [
	{
		"nombre": "Default",
		"color_oscuro": Color("#0078f8"),
		"color_claro": Color("#00e8f8")
	},
	{
		"nombre": "Fuego",
		"color_oscuro": Color("#d82800"),
		"color_claro": Color("#f8d828")
	},
	{
		"nombre": "Metal",
		"color_oscuro": Color("#505050"),
		"color_claro": Color("#f8f8f8")
	},
	{
		"nombre": "Madera",
		"color_oscuro": Color("#a04000"),
		"color_claro": Color("#f8f8f8")
	}
]

func _ready():
	play("idle")
	aplicar_paleta()

func _input(event):

	if event.is_action_pressed("cambiar_arma"):

		paleta_actual += 1

		if paleta_actual >= paletas.size():
			paleta_actual = 0

		aplicar_paleta()

func aplicar_paleta():

	var paleta = paletas[paleta_actual]

	mat.set_shader_parameter("color_oscuro", paleta["color_oscuro"])
	mat.set_shader_parameter("color_claro", paleta["color_claro"])

	label_arma.text = "Color actual: Color " + str(paleta_actual + 1)
