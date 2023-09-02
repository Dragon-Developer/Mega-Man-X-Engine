function player_state_screen_cleaner() {
	var t = state_timer++;

	// State Properties
	grav = 0;
	v_speed = 0;
	using_special_weapon = true;

	player_charge_reset();
	player_effects_reset();

	// [Animations]
	// Start Animation
	if (t == 0)
	{
		animation_play("screen_cleaner");
		player_shoot_projectile(shoot_next_projectile);
	}

	if (t > shoot_limit) {
		player_check_idle();
		player_check_fall();
		using_special_weapon = false;
		shoot = false;
		charge_enabled = true;
		immunity = false;
	}
}
