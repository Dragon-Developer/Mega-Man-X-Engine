function player_state_wall_slide() {
	var t = state_timer++;

	grav = 0;
	walk_speed = walk_speed_default;

	player_counters_reset();
    
	if (t == 0) {
		audio_play(wall_slide_sound);
		if (move != 0)
			xscale = move;
	}
	
	if (wall_slide_animation_enabled) {
		animation = "";
		animation_play("wall_slide", t);
	}

	if (t <= 4)
		substates[0] = 0;
	else
		substates[0] = 1;

	if (t >= 5) {
		dir = -wall_slide_dir;
		xscale = wall_slide_dir;
		
		if (instance_exists(wall_slide_dust))
			script_try(wall_slide_dust.script);
	}
	if (t >= 7)
		v_speed = wall_slide_vspeed;
	else
		v_speed = 0;

	if (is_on_floor(2) || move != wall_slide_dir || can_move_x(wall_slide_dir)) {
		player_state_set(states.fall, 0);
		animation = "";
		animation_play("fall", state_timer);
		
		if (t >= 12)
			dir = -wall_slide_dir;
		
	    if (!is_on_floor(2)) {
			v_speed = 0;
		} else {
			move_down();
			player_state_set(states.idle, 0);
			animation_play("idle");
			if (move != 0)
				dir = move;
		}
		if (is_on_floor() && move == - wall_slide_dir)
			animation_play("walk");
		xscale = dir;
	}

	// Action Scripts
	player_check_walk();
	if (state != states.wall_slide)
		player_check_dash();
	player_check_jump();
	player_check_wall_jump();


}
