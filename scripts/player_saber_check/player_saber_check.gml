if (!saber_unlocked) exit;

// Activate Method
if (saber_atk == noone)
{
	saber_script = noone;
	
	if (key_p_shoot)
	{
		// Normal
		if (!jump && is_on_floor() && v_speed == 0)
		{
			saber_atk = saber_atks.atk1;
		}
		else if (!is_on_floor())
		{
			// Wall Slide
			if (wall_slide)
			{
				saber_atk = saber_atks.wall;
			}
			// Jump
			else
			{
				saber_atk = saber_atks.jump;
			}
		}
		
		if (saber_atk != noone)
		{
			saber_script = saber_scripts[saber_atk];
			saber_atk_animation = saber_atk_animations[saber_atk];
			saber_atk_sound = saber_atk_sounds[saber_atk];
			saber_atk_next = false;
		}
	}
}

script_try(saber_script);

if (saber_end != noone)
{
	if (animation != saber_end_animation || animation_end)
	{
		idle_enabled = true;
		jump_enabled = true;
		jump_animation_enabled = true;
		wall_jump_animation_enabled = true;
		wall_slide_animation_enabled = true;
		fall_enabled = true;
		land_enabled = true;
		dash_enabled = true;
		walk_enabled = true;
		walk_ignore_dir = false;
		walk_ignore_move = false;
		wall_slide_enabled = true;
		wall_jump_enabled = true;
		saber_end = noone;
		
		player_idle();
	}
}