function player_state_wall_jump() {
	var t = state_timer++;

	// Create Spark Effect
	if (t == 1) {
		with (player_effect_create(wall_jump_spark)) {
			move_contact_block(0, -48);
		}
	}
	// Play Animation
	if (t <= 11)
		animation_play("wall_jump", t);
	// Reset Speed and Gravity
	if (t <= 4) {
	    grav = 0;
	    v_speed = 0;
		// Wall Dash Jump
	    if (key_dash && state_unlocked[states.dash]) {
	        if (walk_speed != dash_speed)
				dash_air_count++;
	        walk_speed = dash_speed;
	    }
	}
	// Jump
	if (t == 5)
	    v_speed = -wall_jump_strength;

	if (t >= 6) {
		grav = gravity_default;	
	}
	if (wall_jump_reset_gravity) {
	    grav = 0;
	    v_speed = 0;
	}

	var condition_to_end = false;
	// Move to the opposite side of the wall
	if (t >= 5 && t <= 11) {
		if (!is_on_ceil() || (move != wall_jump_dir)) {
			move_x(-wall_jump_dir * walk_speed);
		}
	    else if (!wall_jump_reset_gravity) {
			v_speed = 0;
			physics_ignore_frame = 1;
			condition_to_end = true;
	    }
	}

	condition_to_end |= (t >= 4 && wall_jump_reset_gravity);
    
	if (t == 12 || condition_to_end) {
		physics_ignore_frame = 1;
	    if (jump_animation_enabled)
			animation_play("jump", 10);
		player_state_set(states.jump, 10, [0]);
	    wall_jump_reset_gravity = false;
		if (is_on_ceil(-jump_strength)) {
			move_y(-jump_strength);	
		}
	}

	// Action Scripts
	player_check_dash();
	player_check_wall_jump();
	player_check_glide();


}
