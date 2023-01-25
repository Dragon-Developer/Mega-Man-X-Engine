function surface_draw_set_objects() {
	var objects = argument[0];
	for (var i = 0; i < array_length_1d(objects); i++) {
		if (!argument[1]) {
			with (objects[i]) {
				draw_on_surface = false;
				ignore_draw = false;
			}
		} else {
			with (objects[i]) {
				draw_on_surface = true;	
			}
		}
	}


}
