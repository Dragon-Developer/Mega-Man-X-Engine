function player_check_glide() {
	if (jumpable_wall_dir() == 0 && !is_on_floor() && state_unlocked[states.glide] && key_p_jump && dash_air_count < dash_air_limit) {
		state_set(states.glide, 0, [0]);
		player_activate_immunity();
	}



}
