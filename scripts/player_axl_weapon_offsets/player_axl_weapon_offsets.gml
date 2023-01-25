function player_axl_weapon_offsets() {
	player_weapon_offsets("shoot", [[27, -9], [2, -31], [18, -23], [4, 17], [19, 9]]);
	player_weapon_offsets("hover_shoot", [[28, -12], [3, -33], [19, -25], [5, 15], [20, 7]]);
	player_weapon_offsets("wall_shoot", [[27, -5], [], [17, -22], [], [18, 14]]);

	switch (weapon[0]) {
		case weapons.a_ray_gun:
			player_weapon_offsets("shoot", [[29, -9], [2, -33], [21, -26], [4, 19], [22, 12]]);
			player_weapon_offsets("hover_shoot", [[30, -12], [3, -35], [22, -28], [5, 17], [23, 10]]);
			player_weapon_offsets("wall_shoot", [[29, -5], [], [16, -24], [], [22, 11]]);
			break;
	}



}
