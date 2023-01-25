x = __view_get(e__VW.XView, 0);
y = __view_get(e__VW.YView, 0);
draw_set_alpha(alpha);

draw_rectangle_color(
	x, y, x + global.view_width, y + global.view_height,
	color, color, color, color, false
);
draw_set_alpha(1);

if (back_sprite != noone) {
	draw_sprite(back_sprite, back_index, x, y);
}