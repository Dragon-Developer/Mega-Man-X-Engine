function player_special_weapons_variables() {
	// Shoryuken
	shoryuken = false;
	shoryuken_effect = player_effect_new(obj_player_shoryuken_effect, 5, 0, layer_down);
	shoryuken_jump_strength = 8;
	shoryuken_limit = 41;
	shoryuken_hspeed = 6.5;
	shoryuken_input = special_input_new([RIGHT, DOWN, DOWN_RIGHT, SHOOT_1],
										[LEFT, DOWN, DOWN_LEFT, SHOOT_1]);
	shoryuken_animation = "shoryuken";

	// Hadouken
	hadouken = false;
	hadouken_input = special_input_new([DOWN, DOWN_RIGHT, RIGHT, SHOOT_1],
										[DOWN, DOWN_LEFT, LEFT, SHOOT_1]);
	hadouken_limit = 42;
	hadouken_inst = noone;

	// Nova Strike
	nova_strike = false;
	nova_strike_hspeed = 5;
	nova_strike_limit = 40;
	nova_strike_sound = snd_player_x_nova_strike;
	nova_strike_object = obj_player_x_shot_nova_strike;
	nova_strike_move = true;

	// Tatsumaki
	tatsumaki_input_left = special_input_new([DOWN, DOWN_RIGHT, RIGHT, SHOOT_2]);
	tatsumaki_input_right = special_input_new([DOWN, DOWN_LEFT, LEFT, SHOOT_2]);

	tatsumaki_limit = 52;
	tatsumaki_hspeed = 2;
	tatsumaki_animation = "tatsumaki";
	tatsumaki_object = obj_player_x_shot_tatsumaki;
	tatsumaki_sprite = spr_x_tatsumaki_mask;
	tatsumaki_sound = snd_player_x_tatsumaki;

	// Double Gear
	double_gear_icon_i = 0;
	double_gear_t = 0;
	double_gear_unlocked = false;
	
	// Speed Gear
	speed_gear = false;
	speed_gear_enabled = true;
	speed_gear_speed = 1/4;
	normal_gear_effect = player_effect_new(obj_player_double_gear_effect, 0, 0, layer_up);
	speed_gear_sprite = spr_speed_gear_effect;
	
	// Power Gear
	power_gear = false;
	power_gear_sprite = spr_power_gear_effect;
	
	// Shin Messenko
	shin_messenko_interval = 8;
	shin_messenko_distance = 48;
	shin_messenko_limit = 5;
	shin_messenko_y_offset = 20;
	
	// Dive Kick
	dive_kick_hspeed = 4;
	dive_kick_vspeed = 4;
	dive_kick_jump_speed = 3;
	dive_kick_end_hspeed = 2;
	dive_kick_object = obj_player_x_shot_dive_kick;
	dive_kick_jump = false;
	dive_kick_limit = 1;
	dive_kick_count = 0;
	
	// Buster
	z_buster_effect = player_effect_new(obj_player_zero_shot_x5_charge, 19, -6, layer_up);
	z_buster_effect_inst = noone;
	
	// All
	using_special_weapon = false;
	special_inst = noone;
}
