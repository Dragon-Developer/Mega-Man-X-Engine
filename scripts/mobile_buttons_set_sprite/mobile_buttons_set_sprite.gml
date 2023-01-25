function mobile_buttons_set_sprite(spr) {
	with (obj_mobile_button_parent) {
		if (btn_type >= mobile_buttons.dash && btn_type < mobile_buttons.weapon1) {
			sprite_index = spr;
			image_index = btn_type - mobile_buttons.dash;
		}
	}
}
function mobile_weapon_swap_set_sprites(wp1_sprite, wp2_sprite) {
	with (obj_mobile_btn_weapon1) {
		sprite_index = wp1_sprite;	
	}
	with (obj_mobile_btn_weapon2) {
		sprite_index = wp2_sprite;	
	}
}