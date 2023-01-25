function player_state_shoryuken() {
	var t = state_timer++;
	ceil_reset_vspeed = false;
	if (t == 0)
		player_activate_immunity(immunity_types.normal);

	if (t == 7)
	{
		v_speed = -shoryuken_jump_strength;
		h_speed = shoryuken_hspeed * dir;
		voice_play();
		special_inst = instance_create_depth(x, y, depth, obj_player_x_shot_shoryuken);
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
		
		if (instance_exists(special_inst))
		{
			special_inst.x = x + h_speed;
			special_inst.y = y + v_speed;
			special_inst.image_xscale = xscale;
		}
	}
	
	if (t > shoryuken_limit && v_speed > 0)
	{
		animation_play(shoryuken_animation + "_fall");
		grav = gravity_default;
		special_inst = instance_try_destroy(special_inst);
	}
	
	if (t >= shoryuken_limit)
	{
		if (is_on_floor())
		{
			if (animation_end)
			{
				player_state_set(states.idle, 0);
				substates[0] = 0;
				using_special_weapon = false;
				immunity = false;
				special_inst = instance_try_destroy(special_inst);
			
			}
			else
			{
				animation_play(shoryuken_animation + "_end");
			
			}
		}
		ceil_reset_vspeed = true;
	}
	player_charge_reset();


}
