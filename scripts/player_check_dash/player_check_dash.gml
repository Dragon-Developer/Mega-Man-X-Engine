function player_check_dash() {
	if (state_unlocked[states.dash]) {
	    // Double Tap
		var result = key_right - key_left;
	    var start_dash = false;
		var keys_p = [key_p_left, key_p_right, key_p_up, key_p_down];
		var dash_tap_index = -1;
		for (var i = 0; i < 4; i++) {
			if (keys_p[i]) {
				if (dash_tap_timers[i] > 0) {
					start_dash = true;
					// Left/Right
					if (i == 0)
						dash_tap_index = 0;
					else if (i == 1)
						dash_tap_index = 1;
					else if (!is_on_floor() && dash_up_unlocked)
						dash_tap_index = i;
					else
						start_dash = false;
					if (start_dash)
						dash_tap_timers = [0, 0, 0, 0];
				} else {
					dash_tap_timers[i] = dash_tap_limit;
				}
			}
			if (dash_tap_timers[i] > 0)
				dash_tap_timers[i]--;
		}
    
	    // Dash Key Pressed or Double Tap
	    if (key_p_dash || start_dash) {
	        var new_dash_dir = dir;
	        var result = key_right - key_left;
		
	        if (result != 0)
				new_dash_dir = result;
		
			if (dash_tap_index == 0)
				new_dash_dir = -1;
			else if (dash_tap_index == 1)
				new_dash_dir = 1;
		
			var dashend = (state == states.dash && substates[2] == 1);
			var dashup = (state == states.dash && substates[1] == 1);
		
		
			if ((!dash_up_unlocked || (!key_up && !key_down) || (start_dash && dash_tap_index < 2) || is_on_floor()) &&
			(can_move_x(dash_speed * new_dash_dir)) &&
			((is_on_floor() && state != states.jump) || (dash_air_unlocked && dash_air_count < dash_air_limit)) &&
			(!dash_tapped || (result != dash_dir && key_p_dash)) &&
			(!start_dash || (new_dash_dir != dash_dir || state != states.dash))) {
				state = states.dash;
				state_timer = 0;
				dir = new_dash_dir;
				dash_dir = dir;
				dash_tap_dir = 0;
				dash_tapped = start_dash;
				substates[0] = !is_on_floor(); // 0 = Normal Dash, 1 = Dash Air
				substates[1] = 0; // 0 = Horizontal, 1 = Up
				substates[2] = 0; // Not Cancelling
				dash_air_count++;
				
			}
			else if ((dash_up_unlocked && key_up && state != states.wall_slide) &&
			(!is_on_ceil() && !is_on_floor() && (dash_air_count < dash_air_limit))/* &&
			(!dashend || !dashup)*/) {
				state = states.dash;
				state_timer = 0;
				dir = new_dash_dir;
				dash_dir = dir;
				dash_tapped = start_dash;
				substates[0] = 1; // Dash Air
				substates[1] = 1; // Up
				substates[2] = 0; // Not Cancelling
				dash_air_count++;
			}
			if (state == states.dash) {
				if (substates[0] && dash_air_immunity) {
					if (dash_air_immunity)
						player_activate_immunity();	
					if (dash_air_blink)
						ds_list_add(immunity_list, new Immunity(immunity_types.none,,true,,state));
				} else {
					if (dash_immunity)
						player_activate_immunity();
					if (dash_blink)
						ds_list_add(immunity_list, new Immunity(immunity_types.none,,true,,state));
				}
			}
	    }
	}
	if (state != states.dash)
		dash_tapped = false;


}
