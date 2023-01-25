function player_state_shoot_pistol() {
	var t = state_timer++;

	shoot_wait = true;
	audio_stop(hover_sound);

	if (substates[0] == 2 && jumpable_wall_dir() == 0) {
		substates[0] = !is_on_floor();
		animation_play("hover_shoot");
	}
	if (is_on_floor()) {
		substates[0] = 0;
		move_down();
	} else {
		if (substates[0] == 0)
			substates[0] = 1;
		if (substates[0] == 1 && t == 0)
			dash_air_count++;
	}

	if (substates[0] == 0) {
		animation_play("shoot");
		effect_top_visible = false;
	}
	if (substates[0] == 1) {
		if ((substates[1] <= hover_shoot_limit && substates[4] == 0) || hover_shoot_inf) {
			grav = 0;
			v_speed = 0;
		} else {
			grav = gravity_default / 3;
			substates[4] = 1;
		}
	} else {
		grav = 0;
		v_speed = 0;
	}
	animation_i = player_get_aim_direction();

	if (substates[0] == 1) {
		player_effect_top(hover_effect[1], hover_effect_speed, hover_effect_limit, 0);
	}

	if (move != 0 && substates[0] != 2) {
		dir = move;
		xscale = move;
	}
	if (substates[0] != 2)
		xscale = dir;
	if (t >= shoot_limit) shoot_wait = false;	

	// End
	if (t > shoot_limit) {
		if (substates[0] == 2 && (move == wall_slide_dir)) {
			player_state_set(states.wall_slide, 7);
			animation_play("wall_slide", 7);
		}
		else {
			player_check_idle();
			player_check_fall();
		}
	}
	substates[1]++;
	var st = state;
	player_check_dash();
	player_check_jump();
	player_check_dodge_roll();
	if (state != states.shoot_pistol) {
		shoot = false;
		shoot_wait = false;
		shoot_wait_press = st != state;
		if (is_on_floor()) substates[4] = 0;
		else substates[4] = 1;
		effect_top_visible = false;
		if (state == states.fall && !key_shoot)
			player_check_move();
	}


}
