/// @description Refills all weapons
/// @param is_damage
function player_weapon_refill() {
	for (var i = 0; i < array_length(weapon_list); i++) {
		var wp = weapon_list[i];
		if (wp >= 0 && weapon_refill_enabled[wp]) {
			var refill_rate = argument[0] ? weapon_damage_refill[wp] : weapon_fill_rate[wp];
			var energy = weapon_energy[wp], energy_max = weapon_energy_max[wp];
			weapon_energy[wp] = clamp(energy + refill_rate, 0, energy_max);
			/*if (keyboard_check(ord("9")))
				weapon_energy[wp] = energy_max;*/
			if (energy != energy_max && weapon_energy[wp] == energy_max) {
				audio_play(weapon_full_sound[wp]);
				if (audio_exists(weapon_full_sound[wp]))
					glow_type = 1;
			}
		}
	}


}
