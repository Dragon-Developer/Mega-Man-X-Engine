var t = saber_atk_t++;

if (t == 0)
{
	if (dash)
	{
		walk_speed = dash_speed;	
	}
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

var do_next_combo = false;

if (saber_atk_next && t >= 5 && !is_on_floor() && !wall_slide) do_next_combo = true;

var cancel_attack = dash || wall_slide;

saber_atk_animation = (is_on_floor()) ? "atk_land" : "atk_jump";	

if (t <= 9 && !cancel_attack) 
{
	animation = "";
	animation_play(saber_atk_animation, t);
}

if (cancel_attack || (animation_end || animation != saber_atk_animation) || do_next_combo)
{
	saber_atk_t = 0;
	saber_script = noone;
	
	if (do_next_combo && !cancel_attack)
	{
		saber_atk_animation = saber_atk_animations[saber_atk];
		saber_script = saber_scripts[saber_atk];
	}
	else
	{	
		if (!cancel_attack)
		{
			saber_end_animation = saber_atk_animation + "_end";
			animation_play(saber_end_animation);
		}
		saber_end = saber_atk;
		saber_atk = noone;
		saber_script = noone;
	}
	
	change_state = 1;
	saber_atk_next = false;
}

if (change_state > -1)
{
	wall_slide = false;
	walk_enabled = change_state || !is_on_floor();
	idle_enabled = change_state;
	jump_animation_enabled = change_state && (saber_end == noone);
	fall_enabled = change_state && (saber_end == noone);
	land_enabled = change_state && (saber_end == noone);
	wall_slide_enabled = change_state;
	wall_jump_animation_enabled = change_state && (saber_end == noone);
	wall_slide_animation_enabled = change_state;
}