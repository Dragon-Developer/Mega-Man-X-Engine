function player_weapon_spend() {
	var wp = argument[0];
	var lvl = (argument_count > 1) ? argument[1] : previous_charge_level;
	var can_use = player_weapon_can_spend(wp, lvl);
	if (can_use) {
		weapon_energy[wp] -= player_weapon_get_cost(wp, lvl);
	}
	return can_use;


}
