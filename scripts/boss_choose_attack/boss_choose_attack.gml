function boss_choose_attack() {
	var tmp_atk_list = ds_list_create(), increase = false;
	do {
		for (var k = ds_map_find_first(attack_properties); !is_undefined(k); k = ds_map_find_next(attack_properties, k)) {
			if (is_undefined(attack_energy[? k]))
				attack_energy[? k] = 1;	
			var p = attack_properties[? k];
			if (increase)
				attack_energy[? k] = min(1, attack_energy[? k] + p[1]);
			// If it contains enough energy to use this attack, add it to the list
			if (attack_energy[? k] >= p[0])
				ds_list_add(tmp_atk_list, k);
		}
		increase = true;
		// Do it until the list isn't empty, in other words, when we can use at least 1 attack
	} until (!ds_list_empty(tmp_atk_list));
	var new_state, state_index;
	do {
		state_index = irandom_range(0, ds_list_size(tmp_atk_list) - 1);
		new_state = tmp_atk_list[| state_index];
	} until (
		// No condition or condition is valid
		(!ds_map_exists(attack_object_condition, new_state) || !instance_exists(attack_object_condition[? new_state]))
	);
	state_set(new_state, 0, [0, 0, 0, 0, 0]);
	ds_list_destroy(tmp_atk_list);



}
