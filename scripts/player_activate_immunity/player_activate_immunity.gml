function player_activate_immunity(immunity_type = immunity_types.normal) {
	immunity = true;
	switch (immunity_type) {
		case immunity_types.normal:
			ds_list_add(immunity_list, new Immunity(immunity_type, -1, false, false, state));
			break;
		case immunity_types.dolor:
			ds_list_add(immunity_list, new Immunity(immunity_type, immunity_length, true, true));
			break;
		case immunity_types.spike:
			ds_list_add(immunity_list, new Immunity(immunity_type, -1, false, true));
			break;
	}
}
