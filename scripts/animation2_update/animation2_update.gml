function animation2_update() {
	for (var i = 0; i < array_length(animation2_sprite); i++) {
		var spr = animation2_sprite[i];
		if (spr != noone && sprite_exists(spr)) {
			var num = sprite_get_number(spr);
			animation2_index[i] += animation2_speed[i];
			if (animation2_index[i] >= num) {
				animation2_index[i] -= num;
			}
		}
	}


}
