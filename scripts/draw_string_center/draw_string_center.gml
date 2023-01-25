/// @description - Draw String on Screen
/// @param x
/// @param y
/// @param string
/// @param _color
function draw_string_center() {

	// Arguments
	var _x = argument[0];
	var _y = argument[1];
	var _text = argument[2];
	var _color = (argument_count > 3 ? argument[3] : colors.blue);
	_x = floor(_x - (get_string_width(_text) / 2));
	draw_string(_x, _y, _text, _color);


}
