function player_check_wall_slide() {
	// If the player is falling close to the wall
	var check_dir = jumpable_wall_dir();
	if (state != states.wall_slide && !is_on_floor() && move != 0
	&& !can_move_x(move) && v_speed > 0 && check_dir != 0 && !locked) {
		state = states.wall_slide;
		state_timer = 0;
	    wall_slide_dir = move;
		if (!immortal) {
			if (spikes_meeting(x + check_dir * 9, y) && death_by_spike) {
				hp = 0;
				exit;
			}
		}
		player_fix_x_axis(move);
	}



}
