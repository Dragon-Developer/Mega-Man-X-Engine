function player_charge_image_index_update() {
	if ((auto_charge) || (charge_level >= charge_sprite_min_level && (charge_t >= charge_limits[charge_sprite_min_level]))) {
		charge_i = (charge_i + 1) mod charge_image_number;
	} else {
		charge_i = 0;	
	}


}
