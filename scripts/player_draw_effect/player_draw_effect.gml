enum effects {
	top, bottom	
}
function player_draw_effect(e, xx = floor(self.x), yy = floor(self.y), ignore_weapon = false) {
	switch(e) {
		case effects.top:
			if (effect_top_visible && sprite_exists(effect_top))
				draw_sprite_ext(effect_top, effect_top_i, xx, yy, xscale, image_yscale, 0, noone, 1);
			if (weapon_overlay_enabled && sprite_exists(weapon_overlay_sprite) && !ignore_weapon)
				draw_sprite_ext(weapon_overlay_sprite, image_index, xx, yy, xscale, image_yscale, 0, noone, 1);	
			break;
		case effects.bottom:
			if (effect_bottom_visible && sprite_exists(effect_bottom))
				draw_sprite_ext(effect_bottom, effect_bottom_i, xx, yy, xscale, image_yscale, 0, noone, 1);
			break;
	}
}
