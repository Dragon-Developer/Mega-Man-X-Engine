function animation2_draw() {
	for (var i = 0; i < array_length_1d(animation2_sprite); i++) {
		var spr = animation2_sprite[i];
		var pos = animation2_pos[i];
		var index = animation2_index[i];
		if (spr != noone && sprite_exists(spr) && animation2_show[i]) {
			draw_sprite(spr, index, pos[0], pos[1]);
		}
	}


}
