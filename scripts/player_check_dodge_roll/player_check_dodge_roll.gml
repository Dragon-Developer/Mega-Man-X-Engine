function player_check_dodge_roll() {
	if (state_unlocked[states.dodge_roll] && state != states.jump && is_on_floor()
	&& key_down && key_p_dash) {
		state_set(states.dodge_roll, 0);
		player_activate_immunity();
	}


}
