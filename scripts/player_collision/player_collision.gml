function player_collision() {
	if (state == states.intro || state == states.outro) exit;
	// Colliding with the ground
	if (is_on_floor(v_speed) && v_speed >= 0) || (is_on_floor() && state == states.jump && state_timer > 1 && v_speed == 0)
	{
		player_fix_x_axis();
	    grav = 0;
	    v_speed = 0;
		if (is_place_free(x, y - 2))
		{
			y = floor(y - 2);
		}
		move_down(10);
		walk_speed = walk_speed_default;
		player_counters_reset();
	}
	// Colliding with the ceiling
	else if (is_on_ceil(v_speed) && v_speed < 0)
	{
		if (is_place_free(x, y + 2))
		{
			y = floor(y + 2);
		}
		move_contact_block(0, -10);
		if (ceil_reset_vspeed)
		{
			v_speed = 0;
		}
	}
	if (state == states.walk) walk_speed = walk_speed_default;
	if (v_speed >= vspeed_max) v_speed = vspeed_max;


}
