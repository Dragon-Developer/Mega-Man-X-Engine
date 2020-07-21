event_inherited();

if (animation_end)
{
	instance_destroy();
	exit;
}

animation_update();
image_index = animation_i;
