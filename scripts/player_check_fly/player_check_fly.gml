function player_check_fly() {
	if (state_unlocked[states.fly] && jumpable_wall_dir() == 0 && !is_on_floor()
	&& key_p_jump && dash_air_count < dash_air_limit) {
		state_set(states.fly, 0);
		player_activate_immunity();
	}


}
