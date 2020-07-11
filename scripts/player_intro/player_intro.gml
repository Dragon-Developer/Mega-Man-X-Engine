if (intro)
{
	grav = 0;
	v_speed = 0;
	
	var t = intro_t++;
	
	if (t == 0)
	{
		x = x_start;
		y = obj_camera.y - 32;
		visible = true;
		animation_play("tp");
		audio_play(intro_sound);
	}
	
	if (y + 8 >= y_start)
	{
		move_down(8);
		
		if (is_on_floor())
		{
			intro = false;
			intro_t = 0;
			intro2 = true;
		}
	}
	else
	{
		y += 8;	
	}
}

if (intro2)
{
	var t = intro2_t++;
	
	if (t == 0)
	{
		animation_play(intro_animation);
	}
	
	if (animation_on_end(intro_animation))
	{
		animation_play(intro_end_animation);
		
		if (intro_end_animation != "")
		{
			audio_play(intro_end_sound);	
		}
	}
	
	if (animation_on_end(intro_end_animation))
	{
		intro2 = false;
		intro2_t = 0;
		locked = false;
	}
}