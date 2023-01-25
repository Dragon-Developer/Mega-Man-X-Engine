function trail_update() {
	var len = array_length(trail_pos);
	for (var i = len - 1; i > 0; i--) {
		trail_pos[i] = trail_pos[i - 1];
	}
	trail_pos[0] = [x, y, trail_visible];
}
