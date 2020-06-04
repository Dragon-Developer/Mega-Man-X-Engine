if (start)
{
	grav = 0;
	v_speed = 0;
	
	var t = start_t;
	
	if (t == 0)
	{
		x = x_start;
		y = obj_camera.y - 32;
		visible = true;
		animation_play("tp");
		audio_play(start_sound);
	}
	
	if (y + 8 >= y_start)
	{
		move_down(8);
		
		if (is_on_floor())
		{
			start = false;
			start_t = -1;
			start2 = true;
		}
	}
	else
	{
		y += 8;	
	}
	
	start_t++;	
}

if (start2)
{
	var t = start2_t;
	
	if (t == 0)
	{
		animation_play("start");
	}
	
	if (animation != "start")
	{
		start2 = false;
		start2_t = -1;
		locked = false;
	}
	
	start2_t++;
}