function player_check_ceil_cling() {
	if (state_unlocked[states.ceil_cling]
	&& (state == states.jump) && (substates[0] == 1)
	&& (!is_place_free(x, floor(y - high_jump_strength - 2)))) {
		state_set(states.ceil_cling, 0);
		move_contact_block(0, -10);
		if (dash_air_count > 0)
			dash_air_count--;
	}


}
