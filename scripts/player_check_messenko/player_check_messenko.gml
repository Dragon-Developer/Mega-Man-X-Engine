function player_check_messenko() {
	if (key_p_special && key_down && is_on_floor() && !using_special_weapon) {
		if (player_weapon_spend(weapons.messenko)) {
			player_state_set(states.messenko, 0);
			using_special_weapon = true;
			player_activate_immunity(immunity_types.normal);
			instance_try_destroy(special_inst);
			weapon_previous = weapon[0];
			player_weapon_select(weapons.messenko);
		}
	}


}
