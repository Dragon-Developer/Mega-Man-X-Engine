var bg_info = global.background_list[| z_index][| phase];
layer_background_sprite(back_id, bg_info.sprite);
with (obj_background_area) {
	if (phase == other.phase && z_index == other.z_index) {
		obj_camera_rds.background_object[other.z_index] = id;
		obj_camera_rds.background_far[other.z_index] = bg_info.far;
	}
}