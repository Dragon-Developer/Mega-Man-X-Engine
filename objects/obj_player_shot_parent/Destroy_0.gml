if (instance_exists(owner) && owner.is_player) {
	if (shot_counted && ds_list_size(shots_group) <= 1) {
		with (owner) {
			shots_count = max(0, shots_count - other.shot_counted);	
			charged_shots_count = max(0, charged_shots_count - other.charged_shot);
			dash_shot_count = max(0, dash_shot_count - other.dash);
		}
	}
}
room_speed = 60;
