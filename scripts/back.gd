extends CanvasLayer


func _on_texture_button_pressed() -> void:
	ScenesManager.change_scene(ScenesManager.Scenes["MAIN_MENU"])