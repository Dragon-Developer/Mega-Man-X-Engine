/// @description
/// @param sprite
/// @param index
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param rot
/// @param color
/// @param alpha
function draw_sprite_offset() {
	draw_sprite_ext(
		argument[0],
		argument[1],
		global.draw_offset[0] + argument[2],
		global.draw_offset[1] + argument[3],
		(argument_count > 4 ? argument[4] : 1),
		(argument_count > 5 ? argument[5] : 1),
		(argument_count > 6 ? argument[6] : 0),
		(argument_count > 7 ? argument[7] : c_white),
		(argument_count > 8 ? argument[8] : 1)
	);


}
