/// @description Draw Objects
/// @param object_array
/// @param on_surface
function draw_objects() {
	var objects = argument[0], on_surf = false;
	if (argument_count > 1) on_surf = argument[1];

	for (var i = 0; i < array_length_1d(objects); i++) {
		if (on_surf) {
			with (objects[i]) {
				object_draw_on_surface();
			}
		} else {
			with (objects[i]) {
				event_perform(ev_draw, 0);
			}
		}
	}


}
