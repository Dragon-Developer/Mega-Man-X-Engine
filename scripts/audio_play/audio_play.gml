function audio_play() {
	if (!global.audio_enabled || argument[0] == noone) return noone;
	if (audio_is_playing(argument[0])) {
		if (ds_map_exists(global.audio_min_limit, argument[0])) {
			var min_limit = global.audio_min_limit[? argument[0]]	
			var play = true;
			var size = ds_list_size(global.audio_playing_list);
			for (var i = 0; i < size; i++) {
				var arr = global.audio_playing_list[| i];
				if (arr[1] == argument[0]) {
					if (audio_is_playing(arr[0]) && audio_sound_get_track_position(arr[0]) < min_limit) {
						play = false;	
					}
				}
			}
			if (!play)
				return noone;
		}
	}
	var index = audio_play_sound(argument[0], 0, (argument_count > 1 ? argument[1] : 0));
	audio_sound_gain(index, global.sfx_volume, 0);
	ds_list_add(global.audio_playing_list, [index, argument[0]]);

	return index;
}
