function player_state_jump() {
	var t = state_timer++;

	if (/*animation_enabled[state] && */t < 4)
		animation_play("jump", t);
	
	if (!key_jump && v_speed < 0)
		v_speed = 0;

	// High Jump
	if (substates[0] == 1) {
		if (t >= high_jump_limit || !key_jump || v_speed > 0) {
			v_speed = 0;
			grav = gravity_default;
			player_state_set(states.fall, 0);
		}
	}

	if (v_speed > 0 && !is_on_floor())
		player_state_set(states.fall, 0);

	if (t >= 1 && is_on_floor()) {
		player_state_set(states.idle, 0);
		walk_speed = walk_speed_default;
		v_speed = 0;
		move_down();
	}

	if (substates[0] == 0)
		player_check_move();

	// Action Scripts
	player_check_dash();
	player_check_jump();
	player_check_wall_jump();
	player_check_hover();
	player_check_fly();
	player_check_ceil_cling();
	player_check_glide();


}
