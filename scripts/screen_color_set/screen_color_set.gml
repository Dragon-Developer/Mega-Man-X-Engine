function screen_color_set() {
	var arr;
	if (is_array(argument[0]))
		arr = argument[0];
	else {
		for (var i = 0; i < argument_count; i++) {
			arr[i] = argument[i];
		}
	}
	for (var i = 0; i < 3; i++) {
		arr[i] /= 255;
	}
	obj_surface.offset_rgb = arr;
	obj_surface.screen_color_default_mode = false;


}
