function player_shoot_pistol_animation() {
	if (state == states.dolor) exit;
	if (state == states.wall_slide) {
		substates[0] = 2;
		dir = -wall_slide_dir;
		xscale = -dir;
	} else if (state != states.shoot_pistol) {
		substates[0] = 0;
		substates[1] = 0;
		grav = 0;
		v_speed = 0;
		if (!is_on_floor())
			substates[0] = 1;
	} else if (key_p_shoot) {
		grav = 0;
		v_speed = 0;
	}

	switch (substates[0]) {
		case 0: animation_play("shoot"); break;
		case 1: animation_play("hover_shoot"); break;
		case 2: animation_play("wall_shoot"); break;	
	}

	if (substates[0] != 1) {
		effect_top_visible = false;
	}

	player_state_set(states.shoot_pistol, 0);

	animation_i = shoot_direction_index;


}
