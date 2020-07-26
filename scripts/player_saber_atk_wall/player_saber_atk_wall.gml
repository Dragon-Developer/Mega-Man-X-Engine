var t = saber_atk_t++;

if (t == 0)
{
	dash = false;
	dash_t = 0;
	change_state = 0;
	audio_play(saber_atk_sound);
}

var change_state = 0;

if (t > 3 && key_p_shoot)
{
	saber_atk_next = true;
}

if (t <= 8)
{
	animation = "";
	animation_play(saber_atk_animation, t);
}
var do_next_combo = false;

if (saber_atk_next && t >= 5 && !is_on_floor() && wall_slide) do_next_combo = true;

var cancel_attack = !wall_slide || is_on_floor() || wall_jump || can_move_x(wall_slide_dir);

if (cancel_attack || animation_end || do_next_combo)
{
	saber_atk_t = 0;
	saber_script = noone;
	
	if (!do_next_combo || cancel_attack)
	{
		saber_end = saber_atk;
		
		if (!cancel_attack)
		{
			saber_end_animation = saber_atk_animation + "_end";
			animation_play(saber_end_animation);
		}
		else
		{
			saber_end = noone;
		}
		
		saber_atk = noone;
	}
	else
	{
		saber_atk_animation = saber_atk_animations[saber_atk];
		saber_script = saber_scripts[saber_atk];	
	}
	change_state = 1;
	saber_atk_next = false;
}

if (change_state > -1)
{
	wall_slide_animation_enabled = change_state;
	idle_enabled = change_state;
	jump_animation_enabled = change_state && (saber_end == noone);
	fall_enabled = change_state && (saber_end == noone);
	land_enabled = change_state && (saber_end == noone);
	//wall_jump_animation_enabled = change_state;
}