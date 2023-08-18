function player_check_dive_kick() {
	if (key_down && key_p_shoot2 && !is_on_floor() && !using_special_weapon) {
		player_state_set(states.dive_kick, 0);
		using_special_weapon = true;
		player_activate_immunity(immunity_types.normal);
		instance_try_destroy(special_inst);		
	}
}
