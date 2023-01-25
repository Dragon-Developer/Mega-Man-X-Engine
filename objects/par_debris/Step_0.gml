enemy_behavior_normal();
///flicker
switch(visible)
{
	case true:
	visible = false;
	break;
	
	case false:
	visible = true;
	break;
	
	default:
	break;
	
}

if (place_meeting(x,bbox_bottom,obj_block_parent)){instance_destroy();}
if (place_meeting(x,bbox_bottom,obj_slope_parent)){instance_destroy();}
if (place_meeting(x,bbox_bottom,obj_square_parent)){instance_destroy();}