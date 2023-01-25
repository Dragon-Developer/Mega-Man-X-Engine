function player_check_giga_crush() {
	if ((key_p_special || (key_p_shoot && weapon[0] == weapons.x2_giga_crush))) {
		if (!using_special_weapon && player_weapon_spend(weapons.x2_giga_crush))
			player_shoot_giga_crush(obj_player_x_shot_giga_crush);
	}


}
