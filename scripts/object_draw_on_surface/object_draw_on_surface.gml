function object_draw_on_surface() {
	if (draw_on_surface && visible) {
		ignore_draw = false;
		x -= other.vx;
		y -= other.vy;
		for (var i = 0; i < array_length_1d(trail_pos); i++) {
			var pos = trail_pos[i];
			pos[0] -= other.vx;
			pos[1] -= other.vy;
			trail_pos[i] = pos;
		}
		event_perform(ev_draw, 0);
		x += other.vx;
		y += other.vy;
		for (var i = 0; i < array_length_1d(trail_pos); i++) {
			var pos = trail_pos[i];
			pos[0] += other.vx;
			pos[1] += other.vy;
			trail_pos[i] = pos;
		}
		ignore_draw = true;
	} else {
		ignore_draw = false;	
	}


}
