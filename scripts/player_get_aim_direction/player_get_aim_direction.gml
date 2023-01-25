function player_get_aim_direction() {
	var k = 0;
	y_result = key_down - key_up;
	if (state != states.wall_slide && (state != states.shoot_pistol || substates[0] != 2)) {
		x_result = key_right - key_left;

		if (y_result != 0) {
		    k = key_up + 3*key_down;
		    k += (x_result != 0)
		}
		return k;
	} else {
		if (key_up) return 2;
		else if (key_down) return 4;
		else return 0;
	}


}
