function player_global_voices_init() {
#region State Voice Names
	for (var i = states.length_all; i >= 0; i--) {
		global.state_voice_name[i] = "";	
	}
	global.state_voice_name[states.jump] = "jump";
	global.state_voice_name[states.wall_jump] = "jump";
	global.state_voice_name[states.dolor] = "dolor";
	global.state_voice_name[states.saber_atk1] = "saber1_normal";
	global.state_voice_name[states.saber_atk2] = "saber2_normal";
	global.state_voice_name[states.saber_atk3] = "saber3_normal";
	global.state_voice_name[states.saber_raikousen] = "raikousen";
	global.state_voice_name[states.hadouken] = "hadouken";
	global.state_voice_name[states.shoryuken] = "shoryuken";
	global.state_voice_name[states.death] = "death";
#endregion
#region Voice Settings
	global.voice_language = "SNES";
	global.player_voices = ds_list_create();
	global.voice_enabled = true;
	for (var i = 0; i < pl_char.length; i++) {
		global.player_voices[| i] = ds_map_create();
		ds_list_mark_as_map(global.player_voices, i);
	}
	global.voice_rcount = 0;
#endregion


}
