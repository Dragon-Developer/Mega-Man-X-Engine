var _dist = 10;

y = floor(y);

if (argument_count) _dist = argument[0];
/*
var count = 0;
var inst = instance_position(x, bbox_bottom + 1, obj_slope_parent);

if (inst)
{
	while(!position_meeting(x, bbox_bottom + 1, obj_slope_parent) && count < _dist)
	{
		y++;
		count++;
	}
}
else
{
	//move_contact_block(0, _dist);
	while(!place_meeting(x, y + 1, obj_square_parent) && count < _dist)
	{
		y++;
		count++;
	}
}
*/
move_contact_block(0, _dist);