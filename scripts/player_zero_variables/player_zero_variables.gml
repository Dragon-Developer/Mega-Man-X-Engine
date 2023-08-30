function player_zero_variables() {
	// Hitbox
	state_hitbox[states.dash] = spr_zero_crouch_mask;
	state_hitbox[states.crouch] = spr_zero_crouch_mask;
	// Shoot
	shoot_unlocked = true;
	charge_unlocked = false;
	charge_palette_enabled = false;
	weapon[0] = noone;
	weapon[1] = noone;
	weapon[2] = weapons.z_buster_x5;

	// Complete Effect
	complete_effect_limit = 17;
	complete_effect.x = -8 - 3;
	complete_effect.y = -16

	// Saber
	saber_unlocked = true;

	// Dash Spark
	dash_spark.object = noone;
	dash_air_unlocked = true;

	// Double Jump
	double_jump_unlocked = true;

	// Dolor
	dolor_animation = "dolor2";

	// Death
	death_orb_sprite = spr_zero_death_orb;

	// Saber
	saber_atk_unlocked[saber_atks.spinning_jump] = true;
	saber_atk_unlocked[saber_atks.up] = true;
	saber_atk_unlocked[saber_atks.down] = true;
	saber_atk_unlocked[saber_atks.dash] = true;
	saber_atk_unlocked[saber_atks.raikousen] = true;

	player_special_weapons_add(states.messenko);

	weapon_allow_pallete = false;

	// Mobile Buttons
	mobile_buttons_set_sprite(spr_zero_mobile_buttons);
	mobile_weapon_swap_set_sprites(spr_mobile_weapon1, spr_mobile_weapon2);

	// Saber color
	saber.plt_index = saber_color.green;

	// Glow
	glow_enabled = true;
	glow_on_light = false;
	default_sprite_origin = { x: 61, y: 64 };
	trail_color = c_red;

	// Outro
	teleport_outro_reset_weapon = false;
}
