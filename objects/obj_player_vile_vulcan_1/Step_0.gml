event_inherited();

if (!destroy)
{
	h_speed = abs_hspeed * dir;
}

animation_update();
image_index = animation_i;

scr_physics_update();