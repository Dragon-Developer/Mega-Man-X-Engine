// It moves the object horizontally, and diagonally if there is a ramp
var _hspeed = argument[0];
var result = false;
var _bbox_h = (_hspeed > 0) ? bbox_right : bbox_left;
// If the path is clear
//if (!position_meeting(_bbox_h + _hspeed, bbox_bottom, obj_block_parent))
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
    // If there is a slope on the way
    //if (place_meeting(x + _hspeed, y, obj_slope_parent) && is_place_free(x, y - 8))
	//show_debug_message("test");
	if (is_on_slope(_hspeed, 0) && is_place_free(x, y - 8) && is_place_free(x + _hspeed, y - 8))
    {
		show_debug_message("test2");
        y -= 8;
        x += _hspeed;
        result = true;
        move_down();
		//while(!place_meeting(x, y + 1, obj_block_parent)) y++;
    }
    else
    {
        var _x = x;
		x = round(x);
		move_contact_block(argument[0], 0);
        result = (x != _x);
    }
}
return result;
