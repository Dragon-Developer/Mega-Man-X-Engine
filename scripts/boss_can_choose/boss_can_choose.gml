function boss_can_choose() {
	var atk = argument[0];
	var p = attack_properties[? atk];
	if (is_undefined(attack_energy[? atk]))
		attack_energy[? atk] = 1;
	return attack_energy[? atk] >= p[0]; // Energy >= Cost


}
