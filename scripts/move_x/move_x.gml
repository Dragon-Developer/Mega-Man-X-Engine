function move_x(dist, down_on_slope = true) {
	// It moves the object horizontally, and diagonally if there is a ramp
	var result = false;
	var _hspeed = dist;
	var _dir = sign(dist);
	if (dist == 0) return false;
	while (dist != 0) {
		if (abs(dist) > 5)
			_hspeed = 5 * _dir;
		else
			_hspeed = dist;
		dist -= _hspeed;
		// If the path is clear
		if (is_place_free(x + _hspeed, y)) {
		    var _down = false;
		    // If the object is going down the ramp
			if (is_on_slope(0, 2)) {
		        // Remind me to move down after walking
		        _down = down_on_slope;
		    }
		    x += _hspeed;
		    result = true;
		    // Prevent this object from bouncing on the slope
			if (_down && is_on_floor(8))
				move_down();
		} else {
		    // If there is a slope on the way and there is no wall
			var is_slope = is_on_slope(_hspeed, 0);
			var yy = y;
			move_contact_block(0, -8);
			var no_wall = is_place_free(x + _hspeed, y);
			if (is_slope && no_wall) {
		        x += _hspeed;
		        result = true;
		        move_down();
		    } else {
		        var _x = x;
				y = yy;
				move_contact_block(_hspeed, 0, 0.5);
		        result |= (x != _x);
		    }
		}
	}
	return result;
}
