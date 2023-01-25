function custom_window_size() {
	// 1, 2, 3, 4, 5
	var s = argument[0];
	window_set_fullscreen((s >= global.fullscreen_index));
	if (s < global.fullscreen_index)
		window_set_size(320 * s, 240 *s);
	screen_update_stretched();
	if (global.center_screen) {
		instance_create_depth(0, 0, 0, obj_window_center);
		global.center_screen = false;
	}
	
}
