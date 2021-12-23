extends Node

enum Menus {
	MAIN_MENU,
	QUICK_PLAY_PROMPT,
	QUIT_PROMPT,

	PROFILE_SELECTOR,
	PROFILE_SELECTOR_DELETE,
	PROFILE_SELECTOR_UPDATE_PROMPT,
	PROFILE_SELECTOR_DELETE_PROMPT,

	SETTINGS,
	SETTINGS_GENERAL,
	SETTINGS_GENERAL_LANGUAGE
	SETTINGS_GRAPHICS,
	SETTINGS_OTHER,
	SETTINGS_CONTROLS,
	SETTINGS_CONTROLS_CUSTOMIZE,
	SETTINGS_CREDITS,
	SETTINGS_ERASE_ALL_PROMPT,
	SETTINGS_ERASE_ALL_EXTRA_PROMPT,
	SETTINGS_RESET_SETTINGS_PROMPT,

	PAUSE_MENU,
	RETURN_PROMPT,

	LEVEL_ENTER,

	INVENTORY,
	INVENTORY_UPGRADE_PROMPT,

	DIALOGUE,

	EXPLANATIONS,

	DEBUG,

	INITIAL_SETUP,

	CUTSCENE,

	SHOP,

	NONE,
}

var menu: int = Menus.MAIN_MENU
var profile_index: int = 0
var profile_index_focus: int = 0
var menu_locked := false
var fade_player_playing := true
var dis_focus_sound := true


func _ready() -> void:
	pause_mode = PAUSE_MODE_PROCESS
	var __: int
	__  = GlobalEvents.connect("level_changed", self, "_level_changed")


func _level_changed(_world: int, _level: int) -> void:
	yield(get_tree(), "physics_frame")
	GlobalUI.menu = GlobalUI.Menus.NONE
