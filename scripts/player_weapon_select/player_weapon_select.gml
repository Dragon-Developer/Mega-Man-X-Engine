function player_weapon_select() {
	var old_weapon = weapon[0];
	weapon[0] = argument[0];
	if (argument[0] == noone) {
		weapon_bar_show = false;
		return;
	}
	var wp = weapon[0];
	if (current_weapon == old_weapon && current_weapon != noone) {
		current_weapon = wp;
	}
	weapon_name = weapon_sprite_name[wp];

	if (weapon_name != "") {
		player_weapon_sprites_init(weapon_name);	
	}
	weapon_bar_show = weapon_show[wp];
	shots_limit = weapon_shots_limit[wp];
	script_try(weapon_offsets_script);


}
