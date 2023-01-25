function player_effect_clear() {
	for (var i = 0; i < ds_list_size(effects_list); i++) {
		var inst = effects_list[| i];
	
		if (instance_exists(inst)) {
			instance_destroy(inst);	
		}
	}

	ds_list_clear(effects_list);


}
