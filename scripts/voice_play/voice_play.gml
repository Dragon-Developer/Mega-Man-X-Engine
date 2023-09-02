function voice_play() {
	// Don't play if it's not enabled
	if (!G.voice_enabled) exit;
	// Get correct voice name
	var voice = "";
	if (argument_count == 0) {
		voice = G.state_voice_name[state];
	} else {
		if (is_string(argument[0])) {
			voice = argument[0];	
		} else if (argument[0] < states.length_all) {
			voice = G.state_voice_name[argument[0]];
		}
	}

	var map = G.player_voices[| my_character];
	if (ds_map_exists(map, voice)) {
		global.voice_rcount += 2/3;
		if (global.voice_rcount > 1000) {
			global.voice_rcount -= 1000;	
		}
		// Get the list that contains the voice sounds
		var list = map[? voice];
		var length = ds_list_size(list);
		var sound_index = noone;
		// Get a random sound index from the list
		if (length >= 1) {
			sound_index = list[| floor(global.voice_rcount) mod length];
		}
		if (sound_index != noone)
			audio_play_sound(sound_index, 0, 0);
			audio_sound_gain(sound_index, global.sfx_volume, 0);
	}


}
