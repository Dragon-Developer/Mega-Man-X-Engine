PAUSE;
event_inherited();

if (instance_hit_player()) {
	if (instance_exists(owner)) {
		with (owner) {
			if (state != dig_labour.laugh)
				state_set(dig_labour.laugh);
		}
	}
	instance_destroy();
}
