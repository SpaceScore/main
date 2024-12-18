extends CharacterBody2D
class_name Player

const FRICTION: float = 2
const SPEED_FACTOR: float = 1
const SQUASH_OFFSET: float = 0.65

const MAX = 10

@export var speed: float = 1
@export var speed_scale: float = 1000

var mouse_position: Vector2
var direction: Vector2

func _ready() -> void:
	Globals.player = self

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("accelerate") and speed < MAX:
		speed += SPEED_FACTOR
	if Input.is_action_just_pressed("decelerate") and speed - SPEED_FACTOR > 0:
		speed -= SPEED_FACTOR

func _process(delta: float) -> void:
	mouse_position = get_global_mouse_position()
	look_at(mouse_position)
	if Input.is_action_pressed("move") and position != mouse_position:
		direction = (mouse_position - position).normalized()
		velocity = direction * speed * speed_scale
		scale = lerp(scale, get_squash_scale(), delta * FRICTION)
	else:
		velocity = lerp(velocity, Vector2.ZERO, delta * FRICTION)
		scale = lerp(scale, Vector2.ONE, delta * FRICTION)
	
	move_and_slide()

func get_squash_scale()->Vector2:
	var ratio = get_speed_ratio()
	return Vector2(ratio * SQUASH_OFFSET, 1/ratio)

func get_speed_ratio():
	return speed/SPEED_FACTOR

func get_display_speed():
	return speed * 100
