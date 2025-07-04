extends Node

@onready var _character = get_parent()

func _input(event: InputEvent):
	if event.is_action_pressed("jump"):
		_character.jump()
	if event.is_action_released("jump"):
		_character.stop_jump()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	_character.run(Input.get_axis("run_left","run_right"))
