extends CharacterBody2D


@export var _speed : float = 8
@export var  _acceleration : float = 16
@export var _deceleration : float = 32

const JUMP_VELOCITY = -400.0

#get the gravity form the project settings to be synced with rigidtbodynodes
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var _direction : float

func _ready():
	print(Global.ppt) 
	_speed *= Global.ppt
	_acceleration *= Global.ppt
	_deceleration *= Global.ppt

#region Public Methods
func face_left():
	return
func face_right():
	pass
func run(direction: float):
	_direction = direction
	
func jump():
	if is_on_floor():
		velocity.y = JUMP_VELOCITY
#endregion

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	if _direction == 0:
		velocity.x = move_toward(velocity.x, 0, _deceleration * delta)
	elif velocity.x == 0 || sign(_direction) == sign(velocity.x):
		velocity.x = move_toward(velocity.x,_direction * _speed, _acceleration * delta)
	else:
		velocity.x = move_toward(velocity.x,_direction * _speed, _deceleration * delta)
		

	move_and_slide()
