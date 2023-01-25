function player_check_speed_gear() {
	var wp = weapons.speed_gear;
	if (!speed_gear && weapon_energy[wp] == weapon_energy_max[wp]) {
		speed_gear_enabled = true;
	}
	if (speed_gear) {
		if (global.tile_shader_multiplier > 0.6) {
			global.tile_shader_multiplier -= 0.05;
		} else {
			global.tile_shader_multiplier = 0.6;	
		}
		weapon_refill_enabled[wp] = false;
		speed_gear_enabled = player_weapon_spend(wp);
		if (!speed_gear_enabled || key_p_special) {
			player_disable_speed_gear();
		}
	}
	else if (key_p_special && !speed_gear && speed_gear_enabled) {
		speed_gear = true;
		global.game_world_speed = speed_gear_speed;
		trail_sprites_enabled = true;
		trail_sprites_remove = false;
		weapon_refill_enabled[wp] = false;
		audio_play(snd_megaman_speed_gear_start);
		var effect = player_effect_create(normal_gear_effect);
		effect.sprite_index = speed_gear_sprite;
		room_image_speed_set(speed_gear_speed);
	}
}
function player_disable_speed_gear() {
	if (speed_gear) {
		audio_play(snd_megaman_speed_gear_end);
		room_image_speed_set(1);
		speed_gear = false;
		global.game_world_speed = 1;
		trail_sprites_enabled = false;
		trail_sprites_remove = true;
		weapon_refill_enabled[weapons.speed_gear] = true;
	}
}