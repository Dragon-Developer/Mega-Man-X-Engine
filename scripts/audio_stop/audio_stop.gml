function audio_stop() {
	// (index, asset_index)
	for (var i = 0; i < ds_list_size(global.audio_playing_list); i++) {
		var audio = global.audio_playing_list[| i];
		if (audio[0] == argument[0]) {
			audio_stop_sound(audio[0]);	
			ds_list_delete(global.audio_playing_list, i);
			break;
		}
		else if (audio[1] == argument[0]) {
			audio_stop_sound(audio[1]);
			ds_list_delete(global.audio_playing_list, i);
			break;
		}
	}
}
