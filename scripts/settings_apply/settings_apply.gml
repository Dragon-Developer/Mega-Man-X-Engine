function settings_apply() {
	enum settings_types
	{
		window_size,
		input
	}
	G.voice_enabled = (G.voice_language != "NONE");
	custom_window_size(global.settings[settings_types.window_size] + 1);
	gamepad_check();
	keys_apply();
	mobile_key_codes_refresh();


}
