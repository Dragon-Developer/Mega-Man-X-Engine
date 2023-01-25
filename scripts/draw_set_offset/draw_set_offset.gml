/// @description - set offset position to draw sprites
/// @param x
/// @param y
function draw_set_offset() {

	var _x = (argument_count > 0 ? argument[0] : global.draw_offset[0]),
		_y = (argument_count > 1 ? argument[1] : global.draw_offset[1]);
	
	global.draw_offset = [_x, _y];


}
