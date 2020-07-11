var _x = camera_get_view_x(view_camera[0]) + 9;
var _y = camera_get_view_y(view_camera[0]) + 95;
var p = argument[0];
scr_draw_vertical_bar(
	_x,
	_y,
	spr_bar1_icon,
	p.my_character,
	p.my_health,
	p.max_health,
	spr_bar1_unit,
	spr_bar1_area,
	spr_bar1_limit
);