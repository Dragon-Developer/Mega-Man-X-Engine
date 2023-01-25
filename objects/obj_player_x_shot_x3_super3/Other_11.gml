/// @description Step
event_inherited();
var t = timer++;

if (!destroy) {
	if (t == 0) {
		trail_init(3);
	}
	if (nearest_enemy == noone || t >= time_to_impact) {
		if (abs(h_speed) > 9) {
			h_accel = 0;
			h_speed = sign(h_speed) * 9;
		}
		if (abs(v_speed) > 9) {
			v_accel = 0;
			v_speed = sign(v_speed) * 9;
		}
		/*if (t >= time_to_impact && (abs(h_speed) > 6 || abs(v_speed) > 6)) {
			h_accel = 0;
			v_accel = 0;
		}*/
	}
	if (t > 0) {
		h_speed += h_accel;
		v_speed += v_accel;
	}
}

scr_physics_update();

if (!destroy || destroy_t > 1) {
	for (var i = 2; i > 0; i--)
	{
		trail_pos[i] = trail_pos[i - 1];
		if (i == 1 && destroy) {
			trail_pos[i] = [x, y, false];
		}
	}
}

trail_pos[0] = [x, y, visible];
animation_update(true);