/// @description Move instance to point with speed
/// @param x
/// @param y
/// @param speed
function move_to_point() {
	var _x = argument[0], _y = argument[1], sp = argument[2];
	var d = point_direction(x, y, _x, _y) * pi / 180;
	x += sp * cos(d);
	y -= sp * sin(d);


}
