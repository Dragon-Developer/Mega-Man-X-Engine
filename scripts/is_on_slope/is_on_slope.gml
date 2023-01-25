function is_on_slope(_x = 0, _y = 1) {
	var _slope = instance_place(x + _x, y + _y, obj_slope_parent);
	return _slope && bbox_bottom <= _slope.bbox_bottom + 2;
}
