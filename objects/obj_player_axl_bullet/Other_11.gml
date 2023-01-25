event_inherited();
if (timer == -1) {
	timer++;
	physics_ignore_frame = 1;
	animation_ignore_frame = 1;
	audio_play(sound);
	exit;
}
if (destroy) {
	var t = destroy_t - 1;
	if (blocked && (t <= 1)) {
		x = xprevious;
		y = yprevious;
		h_speed = -6 * dir;
		v_speed = -3;
		if (dash) {
			grav = 0.25;
		}
	}
}
else {
	var t = timer++;
	abs_speed = abs_max_speed;
	if (object_index == obj_player_axl_bullet) {
		if (t >= 0 && t <= 2) abs_speed = 4;
		else if (t >= 3 && t <= 5) abs_speed = 5;
		else if (t >= 6 && t <= 24) abs_speed = 6;
	}
	h_speed = lengthdir_x(abs_speed, shot_angle);
	v_speed = lengthdir_y(abs_speed, shot_angle);
}

animation_update();
image_index = (image_number / 3) * image_index_start + animation_i;