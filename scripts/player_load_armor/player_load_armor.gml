/// @param refresh_variables
function player_load_armor() {
	var _refresh = false;
	if (argument_count > 0) _refresh = argument[0];
	if (_refresh) player_variables();
	player_armor_order();

	script_try(variables_script);
	script_try(animation_script);
	script_try(armor_script);
	script_try(armor_order_script);

	player_load_sprites();
	player_weapon_sprites_init(weapon_name);
	player_glow_load();

	for (var i = 1; i <= 4; i++) {
		armor_palette_index[i] = player_armor_plt_index(armor[i]);	
	}

	if (FULL != "") {
		armor_palette_index[0] = player_armor_plt_index(FULL);	
	}

	script_try(weapon_offsets_script);


}
