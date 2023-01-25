function menu_button_inside() {
	var b = argument[0];
	var w = sprite_get_width(b[0]),
		h = sprite_get_height(b[0]);
	return point_in_rectangle(mouse_x, mouse_y, b[2], b[3], b[2] + w, b[3] + h);


}
