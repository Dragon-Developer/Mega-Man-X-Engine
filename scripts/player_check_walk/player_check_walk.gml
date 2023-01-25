function player_check_walk() {
	if (v_speed >= grav && v_speed <= 0 && move != 0 && state_enabled[states.walk])
	&& (can_move_x(move * walk_speed) && is_on_floor() && state != states.dash) 
		state_set(states.walk, 0);


}
