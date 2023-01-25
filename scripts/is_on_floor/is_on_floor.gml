function is_on_floor() {
	var _height = 1;

	if (argument_count > 0) {
		_height = abs(argument[0]);
		return !is_place_free(x, y + _height);
	} else {
		var same_frame = _frame == _frame2;
		var same_pos = x == last_x_check && y == last_y_check;
	
		if (same_frame && same_pos) {
			return iof;	
		} else {
			iof = !is_place_free(x, y + _height);
			ioc = !is_place_free(x, y - 1);
			_frame2 = _frame;
			last_x_check = x;
			last_y_check = y;
			return iof;
		}
	}


}
