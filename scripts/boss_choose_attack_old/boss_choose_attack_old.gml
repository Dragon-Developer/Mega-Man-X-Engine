function boss_choose_attack_old() {

	var new_state, state_index;
	do {
		state_index = irandom_range(0, ds_list_size(attacks_list) - 1);
		new_state = attacks_list[| state_index];
	} until (
		// No condition or condition is valid
		(!ds_map_exists(attack_object_condition, new_state) || !instance_exists(attack_object_condition[? new_state]))
		&& // And
		// Different attack or attack count is less than the limit
		((previous_attack != new_state) || !ds_map_exists(attack_limit, new_state) || last_attack_count < attack_limit[? new_state]));
	if (previous_attack != state) {
		last_attack_count = 0;	
	}
	previous_attack = new_state;
	last_attack_count++;
	state_set(attacks_list[| state_index], 0, [0, 0, 0, 0, 0]);


}
