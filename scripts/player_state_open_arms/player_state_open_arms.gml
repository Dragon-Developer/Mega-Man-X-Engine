function player_state_open_arms() {
	var t = state_timer++;

	// State Properties
	grav = 0;
	v_speed = 0;
	using_special_weapon = true;
	shoot_wait = true;
	charge_enabled = false;
	player_effects_reset();

	// [Animations]
	// Start Animation
	if (t == 0)
	{
		if (is_on_floor())
			animation_play("open_arms");	
		else
			animation_play("open_arms_air");	
	}

	// Create Projectiles
	if (t == shoot_at_time) {
		player_shoot_projectile(shoot_next_projectile);
	}

	if (t > shoot_limit) {
		player_check_idle();
		player_check_fall();
		using_special_weapon = false;
		shoot = false;
		shoot_wait = false;
		charge_enabled = true;
	}



}
