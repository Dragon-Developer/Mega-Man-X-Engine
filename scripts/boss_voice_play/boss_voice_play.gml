function boss_voice_play() {
	if (!G.voice_enabled) exit;
	audio_play_sound(argument[0], 0, 0);


}
