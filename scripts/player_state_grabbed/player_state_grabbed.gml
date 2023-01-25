function player_state_grabbed() {
	var t = state_timer++;
	h_speed = 0;
	v_speed = 0;
	grav = 0;
	if (t == 0) {
		player_disable_speed_gear();
		grab_count = 0;
		player_charge_reset();
		player_effects_reset();
		shoot_wait = false;
	}
	var move_p = key_p_right - key_p_left;
	if (move_p != 0 && move_p != grab_last_dir) {
		grab_last_dir = move_p;
		grab_count++;
	}
	if (t == grab_wait) {
		state_set(states.death, 0);
		hp = 0;
	}


}
