function player_check_shoryuken() {
	if (state != states.shoryuken
	&& full_health
	&& !using_special_weapon
	&& is_on_floor() && special_input_pressed(shoryuken_input))
	{
		player_state_set(states.shoryuken, 0);
		substates[0] = 0;
		animation_play(shoryuken_animation);
		using_special_weapon = true;
	}



}
