function menu_update_view_pos() {

	var vy = __view_get(e__VW.YView, 0);
	if (selected_item == 0) __view_set(e__VW.YView, 0, 0);
	else {
		if (item_y + 24 > vy + 240) {
			__view_set(e__VW.YView, 0, item_y + 24 - 240);
			camera_set_view_pos(view_camera[0], 0, item_y + 24 - 240);
		}
		else if (item_y < vy) {
			__view_set(e__VW.YView, 0, max(0, item_y - 24));
		}
	}


}
