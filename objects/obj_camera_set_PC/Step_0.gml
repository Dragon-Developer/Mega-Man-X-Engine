var camera_update = false;
if (global.current_camera != camera_id) {
    if (global.current_camera == -1 && default_camera) {
		global.current_camera = camera_id;
    }
    if (use_change) {
        for (var i = 0; i < 4; i++) {
			if (point_in_rectangle(global.player_x, global.player_y,
			change_min_x[i], change_min_y[i], change_max_x[i], change_max_y[i])) {
                global.current_camera = camera_id;
            }
        }
    }
}

if (!global.player_spawned && !spawned && instance_exists(obj_player_default)) {
	if (point_in_rectangle(obj_player_default.x, obj_player_default.y,
		min_x, min_y, max_x, max_y)) {
		camera_update = true;
		global.current_camera = global.prev_camera;
		spawned = true;
	}
}

if (camera_update || global.current_camera == camera_id) {
    global.camera_min_x = min_x;
    global.camera_min_y = min_y;
    global.camera_max_x = max_x;
    global.camera_max_y = max_y;	
	global.camera_vbor_max_y = vbor_max_y;
	global.camera_vbor_min_y = vbor_min_y;
	default_camera = true;
	if (instance_exists(obj_player_parent)) {
		with (obj_player_parent) {
			limit_y = other.min_y;
			limit_y_death = other.max_y + sprite_height;
			if (other.lock_right)
				limit_x[1] = other.max_x - floor((bbox_right - bbox_left) / 2);
			else
				limit_x[1] = room_width - floor((bbox_right - bbox_left) / 2);
		}
	}
}