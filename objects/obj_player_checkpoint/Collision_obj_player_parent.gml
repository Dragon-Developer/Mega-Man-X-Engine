global.checkpoint_x = x;// + sprite_width / 2;
global.checkpoint_y = y + sprite_height / 2;
global.checkpoint = true;
global.checkpoint_phase = [];
for (var i = 0, len = array_length(obj_camera_rds.background_object); i < len; i++) {
	if (instance_exists(obj_camera_rds.background_object[i]))
		global.checkpoint_phase[i] = obj_camera_rds.background_object[i].phase;
}
global.checkpoint_camera = global.current_camera;