function player_shot_pos_fix() {
	if (instance_exists(owner)) {
		if (owner_x != owner.x || owner_y != owner.y) {
			x += (owner.x - owner_x);
			owner_x = owner.x;
			if (argument_count > 0 && argument[0])
				y += (owner.y - owner_y);
			owner_y = owner.y;
		}
	}


}
