extends CharacterBody2D
class_name Player

const FRICTION: float = 2
const SPEED_FACTOR: float = 40

@export var speed: float = 20

var mouse_position: Vector2
var direction: Vector2

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("accelerate"):
		speed += SPEED_FACTOR
	if Input.is_action_just_pressed("decelerate") and speed - SPEED_FACTOR > 0:
		speed -= SPEED_FACTOR

func _process(delta: float) -> void:
	mouse_position = get_global_mouse_position()
	look_at(mouse_position)
	if Input.is_action_pressed("move") and position != mouse_position:
		direction = (mouse_position - position).normalized()
		velocity = direction * speed
		scale = lerp(scale, Vector2(1/speed * 20, 1/speed), delta * FRICTION)
	else:
		velocity = lerp(velocity, Vector2.ZERO, delta * FRICTION)
		scale = lerp(scale, Vector2.ONE, delta * FRICTION)
	
	move_and_slide()
