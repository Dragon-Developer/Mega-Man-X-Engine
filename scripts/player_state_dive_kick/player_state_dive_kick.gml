function player_state_dive_kick() {
	var t = state_timer++;
	animation_play("dive_kick");

	grav = 0;
	h_speed = 0;
	v_speed = 0;
	move_x(dir * dive_kick_hspeed);
	move_y(dive_kick_vspeed);
	
	if (is_on_floor()) {
		state_set(states.land);
		animation_play("land");
		move_down();
		player_counters_reset();
		using_special_weapon = false;
	}

	player_charge_reset();
	player_saber_reset();

}
