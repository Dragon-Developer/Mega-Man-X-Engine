function player_check_crouch() {
	if (is_on_floor() && state_unlocked[states.crouch] && state_enabled[states.crouch] && key_down) {
		player_state_set(states.crouch, 0);
	}


}
