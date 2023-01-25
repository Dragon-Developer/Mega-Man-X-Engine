// Audio scripts needs refactoring, put all functions in one script called Audio
function audio_init() {
	global.audio_enabled = true;
	// Maps
	global.audio_configs = ds_map_create();
	global.audio_playing_list = ds_list_create();

	// Audios Loop
	audio_config(snd_player_charge, 1.585, 4.450);
	audio_config(snd_megaman_charge ,56064/48000, 105367/48000);

	global.music_stream_list = ds_list_create();
	global.music_streamed_map = ds_map_create();
	global.audio_min_limit = ds_map_create();

	//music_load("ChillPenguin");
	global.music_hidden = noone;
	global.music_playing_index = noone;
	global.music_streamed_info = [noone, noone, noone];
	global.music_played_intro = false;
	// Audio Min Limit to Play
	global.audio_min_limit[? exploding] = 0.3;
	global.audio_min_limit[? exploding2] = 0.3;
	global.audio_min_limit[? exploding3] = 0.3;
	global.audio_min_limit[? exploding4] = 0.3;
	global.audio_min_limit[? exploding5] = 0.3;
	global.audio_min_limit[? enemyhit] = 0.01;
	global.audio_min_limit[? snd_boss_hit] = 0.01;
	global.audio_min_limit[? snd_block] = 0.08;
	global.audio_min_limit[? snd_item_health] = 0.06;
	global.audio_min_limit[? snd_item_heart] = 0.01;
	global.audio_min_limit[? snd_item_weapon] = 0.01;
	global.audio_min_limit[? snd_item_lifeup] = 0.01;
	global.audio_min_limit[? snd_ice_destroy] = 0.01;
	global.audio_min_limit[? snd_octopus_missile] = 0.01;
	instance_create_depth(0, 0, 0, obj_audio_manager);



}
