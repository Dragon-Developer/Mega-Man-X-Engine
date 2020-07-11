// It moves the object horizontally, and diagonally if there is a ramp
var _hspeed = argument[0];
var result = false;
// If the path is clear
if (is_place_free(x + _hspeed, y))
{
    var _down = false;
    // If the object is going down the ramp
	if (is_on_slope(0, 2))
    {
        // Remind me to move down after walking
        _down = true;
    }
    x += _hspeed;
    result = true;
    // Prevent this object from bouncing on the slope
	if (_down && is_on_floor(8))
    {
		move_down();
    }
}
else
{
    // If there is a slope on the way and there is no wall
	if (is_on_slope(_hspeed, 0) && is_place_free(x, y - 8) && is_place_free(x + _hspeed, y - 8))
    {
        y -= 8;
        x += _hspeed;
        result = true;
        move_down();
    }
    else
    {
        var _x = x;
		move_contact_block(argument[0], 0);
        result = (x != _x);
    }
}
return result;
