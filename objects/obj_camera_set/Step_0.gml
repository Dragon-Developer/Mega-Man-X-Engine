if (G.current_camera != camera_id) {
	var camera_update = false;
	
	if (G.current_camera == -1 && default_camera) {
        camera_update = true;
    }
	
    if (use_change) {
        for (var i = 0; i < 4; i++) {
			if (point_in_rectangle(G.player_x, G.player_y,
			change_min_x[i], change_min_y[i], change_max_x[i], change_max_y[i])) {
                camera_update = true;
            }
        }
    }
    else if (point_in_rectangle(G.player_x, G.player_y,	min_x, min_y, max_x, max_y)) {
        camera_update = true;
    }
	
	if (camera_update) {
		G.current_camera = camera_id;
        G.camera_min_x = min_x;
        G.camera_min_y = min_y;
        G.camera_max_x = max_x;
        G.camera_max_y = max_y;
	}
}

