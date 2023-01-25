function player_check_weapon_change() {
	if (state == states.death || !weapon_can_change) exit;

	var old_id = weapon_id;
	var change_dir = key_p_wp1 - key_p_wp2;
	if (change_dir != 0) {
		do {
			weapon_id = (weapon_id + change_dir + 81) mod 81;
		}
		until (weapon_list[weapon_id] != noone && weapon_selectable[weapon_list[weapon_id]]);
	}
	var wp = weapon_list[weapon_id];
	if (old_id != weapon_id) {
		player_weapon_select(wp);
		charge_image_number = 22;
		charge_sprite_min_level = 1;	
		if (auto_charge != weapon_auto_charge[wp]) {
			auto_charge = weapon_auto_charge[wp];
			charge_level = 0;
			charge = false;
			shot_id = 0;
			audio_stop(charge_sound);
			if (auto_charge) {
				charge_sprite_min_level = 0;
				charge_image_number = sprite_get_number(auto_charge_sprite);
			}
		}
	}
	player_weapon_refill(false);


}
