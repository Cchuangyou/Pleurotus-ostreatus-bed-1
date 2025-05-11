extends Area2D

var player_inside = false

func _ready():
	$Label.visible = false
	print("Area2D ready, Label exists:", has_node("Label"))

func _on_Area2D_body_entered(body):
	print("Body entered:", body.name, "Groups:", body.get_groups())
	if body.is_in_group("Player"):
		player_inside = true
		$Label.visible = true
		$Label.text = "press space to harvest"

func _on_Area2D_body_exited(body):
	print("Body exited:", body.name)
	if body.is_in_group("Player"):
		player_inside = false
		$Label.visible = false

func _input(event):
	if player_inside and event.is_action_pressed("interact"):
		print("Interact key pressed")
		interact()

func interact():
	print("Interaction triggered!")
	queue_free()
