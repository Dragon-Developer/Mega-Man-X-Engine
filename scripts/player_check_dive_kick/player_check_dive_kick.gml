function player_check_dive_kick() {
	if (key_down && key_p_shoot2 && !is_on_floor() 
	&& !using_special_weapon && dive_kick_count < dive_kick_limit
	&& can_move_x(dive_kick_hspeed * dir)) {
		dive_kick_count++;
		player_state_set(states.dive_kick, 0, [0]);
		using_special_weapon = true;
		dive_kick_jump = false;
		walk_speed = walk_speed_default;
		xscale = dir;
		player_activate_immunity(immunity_types.normal);
		instance_try_destroy(special_inst);		
	}
}
