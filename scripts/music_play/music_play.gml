function music_play(music_name = "") {
	music_stop();
	global.music_played_intro = false;
	// Stream Audio
	var snd = noone, snd2 = noone;
	global.music_streamed_info = [noone, noone, 0];
	if (music_name != "") {
		// File Name
		var fname = "Music/" + music_name;
		if (file_exists(fname + ".ogg")) {
			snd = audio_create_stream(fname + ".ogg");
			// Save into the Map
			global.music_streamed_info = [snd, noone, 0];
		}
		// Get Loop Start Time
		var start = -1; // No loop
		ini_open(fname + ".ini");
			start = ini_read_real("INFO", "Start", start);
		ini_close();
		// Check if this music has a loop
		if (file_exists(fname + "L.ogg")) {
			// Stream Loop Audio
			snd2 = audio_create_stream(fname + "L.ogg");
			// Save into the Map
			global.music_streamed_info = [snd, snd2, start];
		}
	}
	var _loop = false;
	if (snd == noone) {
		snd = snd2;
		_loop = true;
		global.music_played_intro = true;
	}
	if (music_name == "") {
		global.music_playing_index = noone;
		global.music_played_intro = false;
		exit;
	}
	// Play Music
	global.music_playing_index = audio_play_sound(snd, 0, _loop);
	audio_sound_gain(global.music_playing_index, global.bgm_volume, 0);
}
