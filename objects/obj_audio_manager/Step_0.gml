audio_loop_update();
if (keyboard_check_pressed(vk_f1)) {
	global.dash_lemon_visible = !global.dash_lemon_visible;	
}
if (keyboard_check_pressed(vk_f5)) {
	replay_stop();
}
if (keyboard_check_pressed(vk_f3)) {
	global.show_fps = !global.show_fps;
}
if (keyboard_check(vk_control) and (keyboard_check_pressed(ord("R")))) {
	replay_stop();
	music_stop();
	ds_map_destroy(global.audio_configs);
	ds_list_destroy(global.audio_playing_list);
	ds_list_destroy(global.music_stream_list);
	ds_map_destroy(global.music_streamed_map);
	ds_map_destroy(global.audio_min_limit);
	ds_list_destroy(global.background_list);
	ds_map_destroy(global.armor_plt_index);
	for (var i = 0; i < pl_char.length; i++) {
		var m = G.player_voices[| i];
		if (!ds_exists(m, ds_type_map)) continue;
		for (var action = ds_map_find_first(m); !is_undefined(action); action = ds_map_find_next(m, action)) {
			if (!ds_exists(m[? action], ds_type_list)) continue;
			var action_list = m[? action];
			for (var j = 0; j < ds_list_size(action_list); j++) {
				if (action_list[| j] != noone && audio_exists(action_list[| j]))
					audio_free_buffer_sound(action_list[| j]);	
			}
		}
	}
	ds_list_destroy(global.player_voices); // Destroy recursive
	game_restart();
}