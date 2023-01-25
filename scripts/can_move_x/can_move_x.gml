function can_move_x(hsp) {
	var _x = x, _y = y;
	var result = move_x(hsp);

	x = _x;
	y = _y;

	return result;
}
