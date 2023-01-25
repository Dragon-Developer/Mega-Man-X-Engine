/// @description
/// @param x
/// @param y
/// @param icon_sprite
/// @param index
/// @param amount
/// @param max_amount
/// @param max_bar
/// @param unit_sprite
/// @param area_sprite
/// @param limit_sprite
function scr_draw_vertical_bar(_x, _y, icon, index, amount, max_amount, max_bar, unit, area, limit, unit_color = -1) {

	var hh = sprite_get_height(area);

	// Draw Icon
	draw_sprite(icon, index, _x, _y);

	// Draw Fill Area
	var yy = _y - hh;
	for (var i = 0; i < min(max_amount, max_bar); i++) {
		draw_sprite(area, 0, _x, yy);
		yy -= 2;
	}

	// Draw Limit Border
	draw_sprite(limit, 0, _x, yy + 1)

	// Draw Units
	yy = _y - hh;
	var incunit = (unit_color == -1);
	for (var i = 0; i < amount; i++) {
		if (i mod max_bar == 0 && incunit) {
			yy = _y - hh;
			unit_color++;
		}
		draw_sprite(unit, unit_color, _x, yy);
		yy -= 2;
	
	}

}
