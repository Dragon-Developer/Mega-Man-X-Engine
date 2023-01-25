function player_state_giga_falcon() {
	var t = state_timer++;

	// State Properties
	grav = 0;
	v_speed = 0;
	using_special_weapon = true;
	player_effects_reset();

	// [Animations]
	// Start Animation
	if (t == 0)
	{
		if (is_on_floor()) animation_play("giga");	
		else animation_play("giga_air");	
	}
	// Loop Animation
	if (t == giga_limit[0])
	{
		animation_play("giga_loop");
		audio_play(giga_sound);
	}
	// End Animation
	if (t == giga_limit[1])
	{
		if (is_on_floor()) animation_play("giga_end");	
		else animation_play("giga_end_air");	
	}
	// Create Projectiles
	if (t > giga_limit[0] && t < giga_limit[1])
	{
		if (t mod 5 == 0)
		{
			// ...
			var inst = player_shoot_projectile(obj_player_x_giga_falcon);
			inst.x = __view_get(e__VW.XView, 0) + irandom_range(1, 19) * 16;
			inst.dir = choose(1, -1);
			inst.y = __view_get(e__VW.YView, 0);
			if (inst.dir == -1) inst.y += 240;
			inst.image_yscale = inst.dir;
			shoot_update_position = false;
			inst.depth -= 300;
		}
	}

	if (t >= giga_limit[2])
	{
		player_check_idle();
		player_check_fall();
		using_special_weapon = false;
		shoot_enabled = true;
	}

	player_charge_reset();


}
