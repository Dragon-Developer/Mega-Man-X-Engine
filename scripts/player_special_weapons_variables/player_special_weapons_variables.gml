// Shoryuken
shoryuken = false;
shoryuken_enabled = true;
shoryuken_unlocked = false;
shoryuken_t = 0;
shoryuken_effect = player_effect_new(obj_player_shoryuken_effect, 5, 0, layer_down);
shoryuken_jump_strength = 8;
shoryuken_limit = 41;
shoryuken_hspeed = 6.5;
shoryuken_input = special_input_new([RIGHT, DOWN, DOWN_RIGHT, SHOOT_1],
									[LEFT, DOWN, DOWN_LEFT, SHOOT_1]);
shoryuken_sound = snd_player_x_shoryuken;

// Hadouken
hadouken = false;
hadouken_enabled = true;
hadouken_unlocked = false;
hadouken_t = 0;
hadouken_input = special_input_new([DOWN, DOWN_RIGHT, RIGHT, SHOOT_1],
									[DOWN, DOWN_LEFT, LEFT, SHOOT_1]);
hadouken_limit = 42;
hadouken_sound = snd_player_x_hadouken;

// Nova Strike
nova_strike = false;
nova_strike_t = 0;
nova_strike_enabled = true;
nova_strike_unlocked = false;
nova_strike_hspeed = 5;
nova_strike_limit = 40;
nova_strike_sound = snd_player_x_nova_strike;