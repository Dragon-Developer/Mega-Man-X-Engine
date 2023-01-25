if (global.debug_active) {
	var c = c_red;
	draw_rectangle_color(min_x, min_y, max_x, max_y, c, c, c, c, true);
    if (use_change) {
        for (var i = 0; i < 4; i++) {
			c = $FF00FF;
			draw_rectangle_color(change_min_x[i], change_min_y[i], change_max_x[i], change_max_y[i], c, c, c, c, true);
        }
    }
}

