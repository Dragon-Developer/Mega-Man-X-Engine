function player_check_giga_falcon() {
	if (key_p_special && player_weapon_can_spend(weapons.falcon_giga) && !using_special_weapon) {
		if (state == states.wall_slide) xscale = dir;
		player_state_set(states.giga_falcon, 0);
		player_weapon_spend(weapons.falcon_giga);
		using_special_weapon = true;
		player_activate_immunity(immunity_types.normal);
		instance_try_destroy(special_inst);
	}


}
