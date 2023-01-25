function mobile_joystick_behavior() {
	if (argument[0] == -1) exit;

	mx = device_mouse_x_to_gui(argument[0]);
	my = device_mouse_y_to_gui(argument[0]);

	distance_finger = point_distance(draw_x, draw_y, mx, my);
	joystick_distance = clamp(distance_finger, 0, distance_max);


}
