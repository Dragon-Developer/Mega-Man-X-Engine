function music_stop() {
	if (global.music_playing_index == noone) exit;
	var _timer = (argument_count > 0 ? argument[0] : 0);

	if (_timer != 0) {
		audio_sound_gain(global.music_playing_index, 0, _timer);
	}

	_timer = floor(_timer * room_speed / 1000);

	if (_timer == 0) {
		music_destroy_stream();
		audio_stop_sound(global.music_playing_index);
	}
	else {
		with (obj_audio_manager) {
			alarm[0] = _timer;	
		}
	}


}
