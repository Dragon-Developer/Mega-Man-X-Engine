//if (!G.checkpoint)
var _x = x, _y = y - 10;
if (global.checkpoint) {
	_x = global.checkpoint_x;
	_y = global.checkpoint_y;
	G.current_camera = global.checkpoint_camera;
	with (obj_camera_set_PC) {
		if (G.current_camera == camera_id) {
			event_perform(ev_step, ev_step_normal);
		}
	}

	__view_set(e__VW.XView, 0, clamp(_x - 160, G.camera_min_x, G.camera_max_x - global.view_width));
	__view_set(e__VW.YView, 0, clamp(_y - 120, G.camera_min_y, G.camera_max_y - global.view_height));
	
}
var inst = instance_create_depth(_x, _y, depth, global.character_selected[0]);
inst.armor = G.player_character_armor[G.character_selected_index[0]];
with (inst) {
	player_load_armor(true);	
}
for (var i = 0, len = array_length(global.checkpoint_phase); i < len; i++) {
	check_phase = global.checkpoint_phase[i];
	with (obj_background_area) {
		if (phase == other.check_phase) {
			var bg_info = global.background_list[| i][| phase];
			obj_camera_rds.background_object[i] = self;
			obj_camera_rds.background_far[i] = bg_info.far;
			layer_background_sprite(
				layer_background_get_id(layer_get_id("background_" + string(i + 1))), 
				bg_info.sprite
			);
		}
	}
}
instance_destroy();