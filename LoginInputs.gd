extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


enum {MORGAN, RANDALL, THOMAS, BRADFORD, ELM, WEAVER, MAPLE, JACKSON, LOOKOUT}
func _on_hall_dropdown_item_selected(index: int) -> void:
	var dropdown = $"Floor Dropdown"
	dropdown.select(-1)
	var enabled_floors
	
	match index:
		MORGAN, RANDALL, THOMAS, BRADFORD:
			enabled_floors = [false, true, true, true, true, true, true]
		ELM, WEAVER, MAPLE, JACKSON:
			enabled_floors = [true, false, false, false, false, true, true]
		LOOKOUT:
			enabled_floors = [true, true, false, false, false, false, true]
	
	dropdown.set_item_disabled(0, enabled_floors[0])
	dropdown.set_item_disabled(1, enabled_floors[1])
	dropdown.set_item_disabled(2, enabled_floors[2])
	dropdown.set_item_disabled(3, enabled_floors[3])
	dropdown.set_item_disabled(4, enabled_floors[4])
	dropdown.set_item_disabled(5, enabled_floors[5])
	dropdown.set_item_disabled(6, enabled_floors[6])

func _on_floor_dropdown_item_selected(index: int) -> void:
	var username = $"Username Entry"
	
	if len(username.text) > 0:
		activate_continue_button()

func activate_continue_button():
	$"Continue Button".disabled = false
	$"Continue Button/ColorRect".color = Color(0.353, 0.462, 0.892, 1.0)

func _on_username_entry_focus_exited() -> void:
	var username = $"Username Entry".text
	if not username.ends_with("#1"):
		$"Username Entry".text = username + "#1"

func _on_continue_button_button_down() -> void:
	get_tree().change_scene_to_file("res://WashingMachine.tscn")
