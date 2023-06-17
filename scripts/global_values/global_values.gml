function global_values() {
	global.reload                           = false; // Is the game reloading after a death?
	global.player_x                         = 0;     // Player X coordinate used for the camera and misc other actions
	global.player_y                         = 0;     // Player Y coordinate
	global.player_spawned                   = false; // Has the player spawned yet?
	global.debug_active                     = false; // Is the Debug mode on?
	global.view_width                       = 320;
	global.view_height                      = 240;
	global.checkpoint                       = 0;
	global.checkpoint_x                     = 0;
	global.checkpoint_y                     = 0;
	global.checkpoint_phase					= 0;
	global.current_camera                   = 0;
	global.checkpoint_camera                = 0;
	global.prev_camera                      = 0;
	global.current_camera_collision         = 0;
	global.camera_min_x                     = 0;
	global.camera_min_y                     = 0;
	global.camera_max_x                     = 0;
	global.camera_max_y                     = 0;
	global.camera_vbor_min_y				= -12;
	global.camera_vbor_max_y				= 12;
	global.camera_shake						= false;
	global.check							= false;
	global.paused						    = false;
	global.pause_type					    = pause_types.none;
	global.is_using_door					= 0;
	global.bgm_volume			        	= 0;
	global.sfx_volume			        	= 0;
	global.center_screen = true;
	global.player_lives = 2;
	global.items_count = 0;
	global.difficulty = diff_modes.normal;
	global.dash_lemon_visible = false;
	global.unlocked_points = 0;
	global.golden_armor_enabled = false;
	global.tile_shader_multiplier = 1;
	global.anyone_can_get_armors = 1;
	
	enum diff_modes {
		easy,
		normal,
		hard
	}
	enum pause_types {
		none,
		normal,
		door,
		pickup,
		boss_death,
		special_attack
	};
	global.background_list = ds_list_create();
	global.start_menu_force_state = false;
	global.start_menu_state = menu_states.main;
	global.player_max_health = 16;

	global.gamepad_list = ds_list_create();
	global.gamepad_list_index = 0;
	global.gp_movement = 0; // Directional
	global.gp_name = "";
	for (var i = 0; i < 80; i ++) {
		global.heart_used[i] = 0;
		global.checkpointid[i] = 0;
	}

	shaders_init();
	global.dictionary = ds_map_create();
	global.mobile = (os_type == os_android);
	characters_init();
	text_init();
	display_reset(0, false);
	global.character_selected_index[0] = 0;
	global.character_selected[0] = obj_player_x;
	global.pickup_lifeup_sprite = spr_x_pickup_lifeup;
	global.transition_object_list = ds_list_create();
	for (var i = 0; i < pl_char.length; i++) {
		global.player_character_armor[i] = ["", "", "", "", "", ""];
		global.player_character_armor_index[i] = [0, 0, 0, 0, 0, 0];
	}
	draw_set_circle_precision(64);
	//global.run_from_ide = !global.mobile && parameter_count() == 3 && string_count("GMS2TEMP", parameter_string(2));
	global.run_from_ide = true;
	instance_create_depth(0, 0, 0, obj_window_center);
	global.game_world_speed = 1;
	global.chill_penguin_defeat = 0;
	global.launch_octopus_defeat = 0;
	global.magma_dragoon_defeat = 0;
	global.unarmored_x_defeat = 0;
	global.unarmored_axl_defeat = 0;
	global.show_fps = true;
	// Replay
	global.recording_replay = false;
	global.running_replay = false;
	global.replay_fname = "";
	replay_init();
}