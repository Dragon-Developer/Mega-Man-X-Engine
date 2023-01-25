function scr_physics_update(ignore_solids = true) {
	if (physics_ignore_frame > 0) {
		physics_ignore_frame --;
		exit;
	}
	v_speed = min(vspeed_max, v_speed + grav);
	h_speed += h_acceleration;
	if (ignore_solids) {
		x += h_speed;
		y += v_speed;
	} else {
		if (h_speed != 0)
			move_x(h_speed);
		if (!is_player) {
			move_y(v_speed);
		} else {
			if (is_place_free(x, y + v_speed)) {
				y += v_speed;
			}
		}
	}
	/*
	if (ignore_solids || is_place_free(x, y + v_speed)) y += v_speed;
	if (ignore_solids || is_place_free(x + h_speed, y)) x += h_speed;
	*/
	_frame = _frame2 + 1;
	if (_frame > 10) _frame = 0;
	if (water_physics_enabled) {
		if (!instance_exists(water_instance)) {
			water_instance = instance_place(x, y, obj_water);
			if (instance_exists(water_instance)) {
				if (water_instance != noone && y < water_instance.y) {
					water_instance = noone;	
				}
				if (water_instance != noone) {
					gravity_default = gravity_water;
					vspeed_max = vspeed_max_water;
					if (grav != 0) {
						grav = gravity_default;	
					}
				}
			}
		} else {
			if (y < water_instance.y) {
				water_instance = noone;
				gravity_default = gravity_normal;
				vspeed_max = vspeed_max_normal;
				if (grav != 0) {
					grav = gravity_default;	
				}	
			}
		}
		under_water = instance_exists(water_instance);
	}
}