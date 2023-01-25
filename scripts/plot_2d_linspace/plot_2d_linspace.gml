/// @description  plot_2d_linspace(x1, y1, x2, y2, amount_floor, sprite)
/// @param x1
/// @param  y1
/// @param  x2
/// @param  y2
/// @param  amount_floor
/// @param  sprite
function plot_2d_linspace(argument0, argument1, argument2, argument3, argument4, argument5) {
	var x1, y1, x2, y2, amount, xvals, yvals;
	x1 = argument0;
	y1 = argument1;
	x2 = argument2;
	y2 = argument3;
	sprite = argument5;
	amount = floor(argument4);
	xvals = linspace(x1, x2, amount);
	yvals = linspace(y1, y2, amount);
	for (i = 0; i < amount; i += 1) {
	    draw_sprite(sprite, 0, xvals[|i], yvals[|i]);
	}
	ds_list_destroy(xvals);
	ds_list_destroy(yvals);



}
