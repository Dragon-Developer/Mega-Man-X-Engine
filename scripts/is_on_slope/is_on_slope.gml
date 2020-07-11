var _x = (argument_count > 0) ? argument[0] : 0;
var _y = (argument_count > 1) ? argument[1] : 1;
var _slope = instance_place(x + _x, y + _y, obj_slope_parent);
return _slope && bbox_bottom <= _slope.bbox_bottom + 1;