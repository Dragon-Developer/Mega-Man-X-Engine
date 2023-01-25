function player_check_hover() {
	if (state_unlocked[states.hover] && jumpable_wall_dir() == 0 && !is_on_floor()
	&& key_p_jump && dash_air_count < dash_air_limit)
		state_set(states.hover, 0);



}
