function player_axl_variables() {
	intro_end_animation = "intro_end";
	complete_effect_limit = 24;
	complete_effect.x = 1;
	complete_effect.y = -20;
	outro_move_y = -36;
	// Dash
	dash_air_unlocked = true;
	dash_normal_length = 64;
	dash_spark.object = noone;
	dash_air_limit = 1;

	// Dodge Roll
	state_unlocked[states.dodge_roll] = true;

	// Hover
	state_unlocked[states.hover] = true;
	hover_length[0] = 60;
	hover_effect = [spr_axl_hover_effect, spr_axl_hover_shoot_effect];
	hover_mode = hover_modes.keep_when_falling;
	hover_vertical = true;
	hover_vertical_limit = 1;
	hover_vertical_speed = 0.5;
	hover_effect_speed = 0.2;
	hover_keep_dir = false;
	hover_speed = 2;
	hover_toggle_mode = false;
	hover_effect_layer = effects.top;

	// Weapon
	player_weapon_set(0, weapons.a_pistol);
	player_weapon_set(1, weapons.a_ray_gun);
	player_weapon_select(weapons.a_pistol);
	weapon_hold_mode = true;
	crouch_unlocked = false;
	weapon_allow_pallete = false;

	// Death
	death_orb_sprite = spr_axl_death_orb;

	// Mobile Buttons
	mobile_buttons_set_sprite(spr_axl_mobile_buttons);
	mobile_weapon_swap_set_sprites(spr_mobile_axl_weapon1, spr_mobile_axl_weapon2);
	glow_enabled = true;
	glow_on_light = false;
	energy_drain_x = 4;
}
