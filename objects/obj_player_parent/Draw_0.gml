if (ignore_draw) exit;

player_draw_event();
var _x = x, _y = y;
if (state == states.ride) {
	_x = ride_char_pos.x;
	_y = ride_char_pos.y;
}
		
if (glow_enabled && glow_sprite != noone && (glow_mode = 0 || glow_type == 1)) {
	var a = (glow_type == 1) ? glow_alpha2 : glow_alpha;
	draw_sprite_ext(glow_sprite, image_index, floor(_x), floor(_y), xscale, y_dir, 0, c_white, a);
}

if ((charge || auto_charge) && charge_sprite != noone)
{
	draw_sprite_ext(charge_sprite, charge_i, floor(_x), floor(_y), xscale, image_yscale, 0, noone, 1);	
}
/*
if (state == states.hover && hover_effect != noone)
{
	draw_sprite_ext(hover_effect, hover_effect_i, floor(x), floor(y), xscale, image_yscale, 0, noone, 1);
}
*/
player_draw_effect(effects.top);