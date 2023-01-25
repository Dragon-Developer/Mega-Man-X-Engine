if (!move_x(abs_hspeed*dir)) {
	if (v_speed < 0 && is_on_ceil(v_speed)) {
		instance_destroy();
		exit;
	} else
		v_speed = -4;
} else if (v_speed < 0) {
	v_speed = 0;
	abs_hspeed = 4;
}
