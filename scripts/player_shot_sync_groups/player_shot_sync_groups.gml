function player_shot_sync_groups() {
	for (var i = 0; i < ds_list_size(shots_group); i++) {
		var inst = shots_group[| i];
		if (instance_exists(inst) && inst != self) { 
			inst.charged_shot = charged_shot;
			inst.owner = owner;
			inst.shot_counted = shot_counted;
			ds_list_copy(inst.shots_group, shots_group);
		}
	}
}
