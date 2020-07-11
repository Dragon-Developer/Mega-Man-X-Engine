if (!shoryuken_enabled) exit;

var change_state = -1;

if (shoryuken_unlocked && !shoryuken && is_on_floor() && special_input_pressed(shoryuken_input))
{
	shoryuken = true;
	change_state = false;
	animation_play("shoryuken");
}

if (shoryuken)
{
	var t = shoryuken_t ++;
	
	
	if (t == 7)
	{
		v_speed = -shoryuken_jump_strength;
		h_speed = shoryuken_hspeed * dir;
		audio_play(shoryuken_sound);
	}
	
	if (t > 7)
	{
		if (t < 30 && (t - 8) mod 3 == 0)
		{
			var effect = player_effect_create(shoryuken_effect);
			effect.image_index = irandom_range(0, 1);
			effect.x += irandom_range(-5, 5);
		}
		
		h_speed -= 1 / 3 * dir;
		
		if (sign(h_speed) != dir) h_speed = 0;
		
		if (is_on_ceil() && t < shoryuken_limit)
		{
			v_speed = 0;
			grav = 0;
		}
	}
	
	if (t > 17 && v_speed > 0)
	{
		animation_play("shoryuken_fall");
		grav = gravity_default;
	}
	
	if (t >= shoryuken_limit)
	{
		if (is_on_floor())
		{
			if (animation_end)
			{
				shoryuken = false;
				shoryuken_t = 0;
				change_state = true;
			}
			else
			{
				animation_play("shoryuken_end");
			}
		}
	}
}

if (change_state > -1)
{
	idle_enabled = change_state;
	walk_enabled = change_state;
	dash_enabled = change_state;
	jump_enabled = change_state;
	land_enabled = change_state;
	fall_enabled = change_state;
	wall_slide_enabled = change_state;
	wall_jump_enabled = change_state;
	shoot_enabled = change_state;
	charge_enabled = change_state;
	hadouken_enabled = change_state;
	dash = false;
	dash_tap = false;
}