function player_x_armor() {
	// Default
	palette_texture_set(plt_x_full);
	plt_index_default = 0;

	special_weapons = ds_list_create();
	weapons_script[weapons.x_buster] = player_x_buster_x2;
	charge_level_max = 2;

	/*  If there is a body part or it's a full armor, apply default damage_reduction
		and change dolor animation */
	if (BODY != "" || FULL != "") {
		damage_reduction = 0.5;
		dolor_animation = "dolor2";
	}

	#region X1 - Light Armor
		if (armor_is_full("x1")) {	
			player_special_weapons_add(states.hadouken);
		}

		if (LEGS == "x1") {
			dash_speed = 4;	
		}
		if (BODY == "x1") {
			immunity_length *= 3;
		}
		if (ARMS == "x1") {
			// X-Buster
			charge_level_max = 3;
			weapons_script[weapons.x_buster] = player_x_buster_x1;	
		}
	#endregion
	#region X2 - Giga Armor
		if (armor_is_full("x2")) {	
			player_special_weapons_add(states.shoryuken);
		}

		if (LEGS == "x2") {
			// Air Dash
			dash_air_unlocked = true;
			dash_air_length = dash_normal_length;
		}

		if (BODY == "x2") {
			player_weapon_set(8, weapons.x2_giga_crush);
			player_special_weapons_add(states.giga_crush);
		}

		if (ARMS == "x2") {
			weapons_script[weapons.x_buster] = player_x_buster_x2;
			charge_level_max = 4;
			charge_sprites[4] = spr_player_charge_3;
			charge_palettes = [0, 1, 1, 2, 2];
		}

	#endregion
	#region X3 - Max Armor
		if (LEGS == "x3") {
			// Air Dash
			dash_air_unlocked = true;
			dash_up_unlocked = true;
		}
		if (BODY == "x3") {
			defense_shield_unlocked = true;
		}
		if (ARMS == "x3_s") {
			charge_level_max = 4;
			charge_sprites[4] = spr_player_charge_saber;
			charge_palettes = [0, 1, 1, 2, 3];	
			weapons_script[weapons.x_buster] = player_x_buster_x3_saber;
			weapons_script[weapons.hyper_charge] = player_x_hyper_charge_saber;
			auto_charge_palette = 3;
		}
		if (ARMS == "x3") {
			charge_level_max = 4;
			charge_sprites[4] = spr_player_charge_3;
			charge_palettes = [0, 1, 1, 2, 7];	
			weapons_script[weapons.x_buster] = player_x_buster_x3;
			auto_charge_palette = 7;
		}
		if (HELM == "x3") {
			weapon_cost_reduce_rate = 0.5;	
		}
		if (armor_is_full("x3")) {
			player_special_weapons_add(states.tatsumaki);
			if (keyboard_check(ord("K")) || mouse_check_button(mb_left) || mouse_check_button(mb_right)) {
				global.golden_armor_enabled	= true;
			}
		}
		if (armor_is_full("x3") && global.golden_armor_enabled) {
			plt_index_default = 8;
			dash_air_limit = 2;
			defense_shield_sprite = spr_player_shield_orange;
			defense_shield_damage_reduction = 0.75;
			player_weapon_set(8, weapons.hyper_charge)
			auto_regen = true;
			tatsumaki_animation = "tatsumaki2";
			tatsumaki_sprite = spr_x_tatsumaki2_mask;
		}
	#endregion
	#region X4 - Force Armor
		if (LEGS == "x4") {
			// Air Dash
			dash_air_unlocked = true;
			// Hover
			state_unlocked[states.hover] = true;
		}
		if (ARMS == "x4_1") {
			// X-Buster
			charge_level_max = 3;
			charge_limits[3] = charge_limits[2];
			weapons_script[weapons.x_buster] = player_x_buster_x4;	
		}
	#endregion
	#region X4 - Ultimate Armor
		if (FULL == "ult") {
			// Intro
			intro_end_sound = snd_player_intro_end;
			// Air Dash
			dash_air_unlocked = true;
			dash_up_unlocked = true;
			// Hover
			state_unlocked[states.hover] = true;
			glow_enabled = true;
			glow_name = "glow_ult";
			// Special Weapon
			player_special_weapons_add(states.nova_strike);
			// X-Buster
			charge_level_max = 3;
			charge_limits[3] = charge_limits[2];
			weapons_script[weapons.x_buster] = player_x_buster_x4;
		}
	#endregion
	#region X5 - Falcon Armor
		if (BODY == "falcon") {
			armor_part_parent[P_EXT1] = P_BODY;
			player_weapon_set(8, weapons.falcon_giga);
			player_special_weapons_add(states.giga_falcon);
			fly_effect2 = spr_x_fly_effect_bottom_falcon;
			fly_length += 90;
		}
		if (ARMS == "falcon") {
			weapons_script[weapons.x_buster] = player_x_buster_falcon;
		}
		if (LEGS == "falcon") {
			state_unlocked[states.fly] = true;
			dash_air_limit = 1;
			dash_air_unlocked = true;
			//dash_air_immunity = true;
			fly_effect = spr_x_fly_effect_top_falcon;
			//glow_enabled = true;
			//glow_name = "glow_falcon";
			//glow_on_light = true;
		}
	#endregion
	#region X5 - Gaea Armor
		if (LEGS == "gaea") {
			wall_slide_vspeed = 0;
			instance_destroy(wall_slide_dust);
			player_activate_immunity(immunity_types.spike);
			dash_speed = 3;
		}
		if (HELM == "gaea") {
			charge_speed = 2;	
		}
		if (ARMS == "gaea") {
			charge_limits[2] = charge_limits[1];
			weapons_script[weapons.x_buster] = player_x_buster_gaea;
		}
		if (BODY == "gaea") {
			damage_reduction = 0.625;
		}
	#endregion
	#region X6 - Shadow Armor
		if (FULL == "shadow") {
			wall_slide_vspeed = 0;
			dash_air_unlocked = true;
			dash_speed = 4.5;
			dash_normal_length = 26;
			state_unlocked[states.ceil_cling] = true;
			state_unlocked[states.high_jump] = true;
			instance_destroy(wall_slide_dust);
			// X-Buster
			weapons_script[weapons.x_buster] = player_x_buster_shadow;
			// Saber
			saber_unlocked = true;
			saber_atk_unlocked[saber_atks.atk2] = false;
			//saber_atk_unlocked[saber_atks.jump] = false;
			saber_atk_unlocked[saber_atks.wall] = false;
			saber_atk_animations[saber_atks.atk1] = "atk3";
			saber_key = 2;
			player_activate_immunity(immunity_types.spike);
			weapon_allow_pallete = false;
		}
	#endregion
	#region X7 - Glide Armor
		if (LEGS == "x7") {
			dash_air_unlocked = true;
			state_unlocked[states.glide] = true;
		}

		if (ARMS == "x7") {
			weapons_script[weapons.x_buster] = player_x_buster_x7;
			charge_level_max = 3;
		}
		if (BODY == "x7") {
	
		}
	#endregion
	#region X8 - Ultimate Armor
		if (FULL == "x8_ult") {
			// This armor has a different nova strike animation
			animation_add("nova_strike",
			[
				0, 0,
				2, 1,
				4, 2,
				8, 3,
				10, 4,
				12, 5,
				13, 6,
				14, 7,
				15, 8,
				16, 9
			], 13, 16);
			// Special Weapon
			player_special_weapons_add(states.nova_strike);
			nova_strike_object = obj_player_x_shot_nova_strike_x8;
			weapon_fill_rate[weapons.nova_strike] = (1 / 60) * (28 / 5);
			weapon_full_sound[weapons.nova_strike] = snd_player_full_weapon;
			weapon_selectable[weapons.nova_strike] = true;
			weapon_costs[weapons.nova_strike] = [-1];
			nova_strike_limit = 50;
			player_weapon_set(8, weapons.nova_strike);
			dash_air_unlocked = true;
			// X-Buster
			charge_level_max = 3;
			charge_limits[3] = charge_limits[2];
			weapons_script[weapons.x_buster] = player_x_buster_x8;
			weapon_allow_pallete = false;
			wall_jump_strength = 7;
			jump_strength = 7;
			dash_speed = 4;
			weapon_cost_reduce_rate = 1;
			dash_immunity = true;
			dash_air_immunity = true;
			dash_air_blink = true;
			dash_blink = true;
			glow_enabled = true;
			glow_on_light = true;
		}
	#endregion
	#region Hermes
		if (armor_is_full("hermes")) {
			glow_enabled = true;
			glow_on_light = true;
		}
	#endregion
	#region Icarus
		if (armor_is_full("icarus")) {
			glow_enabled = true;
			glow_on_light = true;
		}
	#endregion
	#region MMXC - Phoenix Armor
		if (LEGS == "phoenix") {
			// Dash Fire Effect
			dash_dust.object = obj_player_x_dash_fire;
			dash_dust.min_limit = 0;
			dash_dust.max_limit = dash_normal_length;
			// Air-Dash
			dash_up_unlocked = true;
			dash_air_unlocked = true;
		}

		if (armor_is_full("phoenix")) {
			plt_index_default = player_armor_plt_index("phoenix");
		}
	#endregion
	#region Command Mission
		if (FULL == "cm") {
			dash_air_unlocked = true;
			dolor_animation = "dolor";
		}
	#endregion

}
