extends Node3D

@onready var huki = get_node("huki")
@onready var comet = get_node("comet")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	huki.move(delta)
	comet.update()
	if huki.can_shoot(comet) && Input.is_action_pressed("ui_select"):
		comet.set_move(huki,delta)
