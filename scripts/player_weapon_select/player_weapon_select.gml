function player_weapon_select() {
	weapon[0] = argument[0];
	var wp = weapon[0];
	weapon_name = weapon_sprite_name[wp];

	if (weapon_name != "") {
		player_weapon_sprites_init(weapon_name);	
	}
	weapon_bar_show = weapon_show[wp];
	shots_limit = weapon_shots_limit[wp];
	script_try(weapon_offsets_script);


}
