function boss_attack_recover_energy() {
	for (var k = ds_map_find_first(attack_energy); !is_undefined(k); k = ds_map_find_next(attack_energy, k)) {
		if (is_undefined(attack_properties[? k]) || (argument_count > 0 && k == argument[0]))
			continue;
		var p = attack_properties[? k];
		attack_energy[? k] = min(1, attack_energy[? k] + p[1]);
	}


}
