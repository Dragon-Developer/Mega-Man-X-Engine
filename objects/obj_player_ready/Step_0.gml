// Animation
var t = animation_t;

if (t >= 0 && t <= 25)
{
    image_index = t div 2;
}

if (t >= 35)
{
    visible = (((t - 35) mod 8) > 3);
}

if (t == 83)
{
	if (instance_exists(obj_player_parent))
	{
		obj_player_parent.start = true;	
	}
	instance_destroy();
	exit;
}

animation_t++;