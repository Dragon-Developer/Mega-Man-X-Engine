draw_offset_view();
if (global.show_fps) {
	draw_string(266, 4, "FPS:" + string(fps));
	if (global.paused && global.pause_type == pause_types.normal) {
		draw_string_center(160, 120, "PAUSED");	
	}
}