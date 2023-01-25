function characters_init() {
	global.character_object[pl_char.x]			= obj_player_x;
	global.character_object[pl_char.zero]		= obj_player_zero;
	global.character_object[pl_char.axl]		= obj_player_axl;
	global.character_object[pl_char.iris]		= obj_player_iris;
	global.character_object[pl_char.vile]		= obj_player_vile;
	global.character_object[pl_char.megaman]	= obj_player_megaman;
	global.character_name[pl_char.x]		= "x";
	global.character_name[pl_char.zero]		= "zero";
	global.character_name[pl_char.axl]		= "axl";
	global.character_name[pl_char.iris]		= "iris";
	global.character_name[pl_char.vile]		= "vile";
	global.character_name[pl_char.megaman]  = "megaman";
	player_global_armor_settings();
	player_global_voices_init();


}
