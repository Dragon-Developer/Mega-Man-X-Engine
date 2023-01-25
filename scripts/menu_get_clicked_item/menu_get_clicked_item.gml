function menu_get_clicked_item() {
	if (!mouse_check_button_pressed(mb_left)) return -1;

	for (var i = 0; i < array_length(items); i++) {
		var item = items[i];
		if (array_length(item) < 2)
			continue;
		var r = item[1];
		if (!is_array(r) || array_length(r) < 4)
			continue;
		if (point_in_rectangle(mouse_x, mouse_y, r[0], r[1], r[0] + r[2], r[1] + r[3]))
			return i;	
	}

	return -1;


}
