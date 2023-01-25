function player_state_ceil_cling() {
	var t = state_timer++;

	animation_play("ceil", t);

	grav = 0;
	v_speed = 0;

	if (move != 0) {
		dir = move;
		xscale = move;
	}

	var condition = (t >= ceil_cling_limit || !is_on_ceil());
	
	condition |= key_p_jump;
	
	if (condition) {
		grav = gravity_default;
		player_state_set(states.fall, 0);
	}

	player_check_dash();

	if (state == states.dash)
		y_dir = -1;


}
