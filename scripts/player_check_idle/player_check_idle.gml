function player_check_idle() {
	if (is_on_floor()) {
		animation_play(idle_animation, 0);
		state_set(states.idle, 0);
	}


}
