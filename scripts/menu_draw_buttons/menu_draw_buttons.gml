function menu_draw_buttons() {
	for(var i = 0; i < ds_list_size(buttons); i++) {
		// sprite, image, x, y, xscale 
		var b = buttons[| i];
		draw_sprite_ext(b[0], b[1], b[2], b[3], 1, 1, 0, c_white, 1);
	}


}
