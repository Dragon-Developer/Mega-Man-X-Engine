var radius = sprite_width / 2;
distance_max = radius * (1 - radius_border);

mobile_joystick_behavior(mouse_id);

if (!device_mouse_check_button(mouse_id, mb_left)) {
	hold = false;
	mouse_id = -1;
	for (var i = 0; i < 10; i++) {
		mobile_joystick_behavior(i);
		if (device_mouse_check_button(i, mb_left)) {
			if (distance_min <= distance_finger && distance_finger <= radius) {
				hold = true;
				mouse_id = i;
				break;
			}
		}
	}
}

if (!hold) {
	circle_x = 0;
	circle_y = 0;
}

if (hold) {
	dir = point_direction(draw_x, draw_y, mx, my);
	circle_x = lengthdir_x(joystick_distance, dir);
	circle_y = lengthdir_y(joystick_distance, dir);
	up = (dir >= angle_region && dir <= 180 - angle_region);
	down = (dir >= 180 + angle_region && dir <= 360 - angle_region); 
	left = (dir >= 90 + angle_region && dir <= 270 - angle_region); 
	right = (dir >= 270 + angle_region || dir <= 90 - angle_region);
} else {
	up = false;
	down = false;
	left = false;
	right = false;
}

key_p_up = (!key_up && up);
key_p_down = (!key_down && down);
key_p_left = (!key_left && left);
key_p_right = (!key_right && right);

key_up = up;
key_down = down;
key_left = left;
key_right = right;

if (instance_exists(obj_player_parent)) {
	with (obj_player_parent) {
		key_up = other.key_up;
		key_p_up = other.key_p_up;
		key_down = other.key_down;
		key_p_down = other.key_p_down;
		key_left = other.key_left;
		key_p_left = other.key_p_left;
		key_right = other.key_right;
		key_p_right = other.key_p_right;
	}
}