class_name Player
extends CharacterBody2D

@export var speed : float = 200
@export var animation_tree : AnimationTree

var input
var playback : AnimationNodeStateMachinePlayback

func _ready() -> void:
	playback = animation_tree["parameters/playback"]

func _physics_process(delta: float) -> void:
	input = Input.get_vector("left", "right", "up", "down")
	velocity = input * speed
	move_and_slide()
	travel_blendspace2d()
	update_AnimationTree_Params()
	
func travel_blendspace2d():
	if input == Vector2.ZERO:
		playback.travel("Idle")
	else:
		playback.travel("Walk") 
	
	
func update_AnimationTree_Params():
	if input == Vector2.ZERO:
		return
	
	animation_tree["parameters/Idle/blend_position"] = input
	animation_tree["parameters/Walk/blend_position"] = input
	
	
