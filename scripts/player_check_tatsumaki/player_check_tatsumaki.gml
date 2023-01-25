function player_check_tatsumaki() {
	var _right = special_input_pressed(tatsumaki_input_right);
	var _left = special_input_pressed(tatsumaki_input_left);
	if (state != states.tatsumaki
	&& !using_special_weapon
	&& full_health
	&& (_right || _left)
	&& dash_air_count < dash_air_limit
	) {
		state_set(states.tatsumaki, 0, [is_on_floor()]);
		using_special_weapon = true;
		v_speed = 0;
		dir = _right - _left;
		xscale = dir;
	}


}
