function smoke_update() {
	if (smoke && smoke_object != noone) {
		if (smoke_timer++ >= smoke_limit) {
			var _x = smoke_pos[0], _y = smoke_pos[1];
			instance_create_depth(x + _x*dir, y + _y, depth + 1, smoke_object);
			smoke_timer = 0;
		}
	}
}
