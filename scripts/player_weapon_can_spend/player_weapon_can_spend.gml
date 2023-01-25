function player_weapon_can_spend() {
	var wp = argument[0];
	var lvl = (argument_count > 1) ? argument[1] : charge_level;
	return (weapon_energy[wp] >= player_weapon_get_cost(wp, lvl));


}
