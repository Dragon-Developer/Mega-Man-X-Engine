// It moves the object horizontally, and diagonally if there is a ramp
var _hspeed = argument[0];
var result = false;
// If the path is clear
if (place_free(x + _hspeed, y))
{
    var _down = false;
    // If the object is going down the ramp
    if (place_meeting(x, y + 2, obj_slope_parent))
    {
        // Remind me to move down after walking
        _down = true;
    }
    x += _hspeed;
    result = true;
    // Prevent this object from bouncing on the slope
    if (_down && !place_free(x, y + 8))
    {
        move_down();
    }
}
else
{
    // If there is a slope on the way
    if (place_meeting(x + _hspeed, y, obj_slope_parent) && place_free(x, y - 8))
    {
        y -= 8;
        x += _hspeed;
        result = true;
        move_down();
    }
    else
    {
        var _x = x;
        
        if (argument[0] > 0)
        {
            move_contact_solid(0, ceil(argument[0]));
        }
        else
        {
            move_contact_solid(180, ceil(-argument[0]));
        }
        result = (x != _x);
    }
}
return result;
