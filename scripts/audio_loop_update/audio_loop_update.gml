function audio_loop_update() {
	// Loop (https://www.youtube.com/watch?v=kASnhDrj8So)
	for (var i = 0; i < ds_list_size(global.audio_playing_list); i++) {
		var audio = global.audio_playing_list[| i];
		var audio_index = audio[0], audio_asset_index = audio[1];
	
		if (!audio_is_playing(audio_index)) {
			ds_list_delete(global.audio_playing_list, i--);
			continue;
		}
	
		var config = global.audio_configs[? audio_asset_index];
	
		if (is_undefined(config)) continue;
	
		var intro_length = config[0];
	
		if (intro_length <= 0) continue;
	
		var loop_length = config[1], total_length = config[2];
		var pos = audio_sound_get_track_position(audio_index);
	
		if (pos >= total_length)
		    audio_sound_set_track_position(audio_index, pos - loop_length);
	}
	// Music Loop
	if (global.music_playing_index == noone) exit;
	if (audio_is_playing(global.music_playing_index) && !global.music_played_intro) {
		var pos = audio_sound_get_track_position(global.music_playing_index);
		var start = global.music_streamed_info[2];
		if (pos >= start) {
			if (global.music_streamed_info[1] != noone) {
				global.music_played_intro = true;
				var current_level = audio_sound_get_gain(global.music_playing_index);
				audio_stop_sound(global.music_playing_index);
				global.music_playing_index = audio_play_sound(global.music_streamed_info[1], 0, true);
				audio_sound_set_track_position(global.music_playing_index, pos - start);
				audio_sound_gain(global.music_playing_index, current_level, 0);
				if (alarm[0] > 0) {
					music_stop(alarm[0] * 1000 / 60);	
				}
			}
		}
	}
	if (audio_is_playing(global.music_playing_index)) {
		if (global.game_world_speed == 1) {
			audio_sound_pitch(global.music_playing_index, 1);
		} else {
			audio_sound_pitch(global.music_playing_index, 1/2);
		}
	}

}
