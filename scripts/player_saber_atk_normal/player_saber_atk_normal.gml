var t = saber_atk_t++;

if (t == 0)
{
	var result = key_right - key_left;
	if (result != 0) dir = result;
	image_xscale = dir;
	animation_play(saber_atk_animation);
	dash = false;
	dash_t = 0;
	dash_end = false;
	saber_end = noone;
	jump_enabled = false;
	
	audio_play(saber_atk_sound);
}

var change_state = 0;

if (t > 3 && key_p_shoot)
{
	saber_atk_next = true;
}

var do_next_combo = false;

if (saber_atk_next && t >= 8 && saber_atk < saber_atks.atk3) do_next_combo = true;

var cancel_attack = dash || jump || !is_on_floor();

if (cancel_attack || animation_end || do_next_combo)
{
	saber_atk_t = 0;
	
	if (do_next_combo && !cancel_attack)
	{
		if (saber_atk < saber_atks.atk3)
		{
			saber_atk++;
			saber_atk_animation = saber_atk_animations[saber_atk];
			saber_atk_sound = saber_atk_sounds[saber_atk];
		}
	}
	else
	{
		saber_end = saber_atk;
		
		if (!cancel_attack)
		{
			saber_end_animation = saber_atk_animation + "_end";
			animation_play(saber_end_animation);
		}
		
		saber_atk = noone;
		change_state = 1;
	}
	saber_atk_next = false;
}

if (change_state > -1)
{
	idle_enabled = change_state && (saber_end == noone);
	walk_enabled = change_state;
	jump_enabled = change_state;
	jump_animation_enabled = true;
}