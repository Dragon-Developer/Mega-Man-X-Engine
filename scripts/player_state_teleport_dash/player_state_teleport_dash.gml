function player_state_teleport_dash() {
	var t = state_timer++;
	var cancel = key_p_shoot2;
	
	grav = 0;
	v_speed = 0;
	h_speed = 0;
	// Start
	if (substates[0] == 0) {
		if (t == 0) {
			sound_play(snd_zero_nightmare_teleport);	
		}
		animation_play("teleport", t);
		if (t >= teleport_dash_start) {
			state_set(state, 0, [1]);
		}
	}
	else if (substates[0] == 1) {
		move_x(teleport_dash_speed * move, false);
		move_y(teleport_dash_speed * (key_down - key_up));
		if (move != 0) {
			dir = move;
			xscale = move;
		}
		if (t >= teleport_dash_duration || cancel) {
			state_set(state, 0, [2]);
			animation_play("teleport_end");
			sound_play(snd_zero_nightmare_teleport);	
		}
	}
	else if (substates[0] == 2) {
		if (t >= teleport_dash_end) {
			using_special_weapon = false;
			substates[0] = 0;
			player_check_idle();
			ds_list_clear(immunity_list);
			player_check_fall();
		}
	}

	player_charge_reset();
	player_saber_reset();
}