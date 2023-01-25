//control position and orientation

//if (!visible && mask_index == sprite_index)
//	destroy = true;
image_index  = owner.image_index;
image_xscale = owner.xscale;
image_yscale = owner.image_yscale;

draw_x = owner.x;
draw_y = owner.y;

scr_weapon_collision();

if (destroy)
{
	x = -infinity;
	y = -infinity;
}
else
{
	x = owner.x;
	y = owner.y;
}
