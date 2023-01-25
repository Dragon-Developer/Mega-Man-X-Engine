function trail_init() {
	for (var i = argument[0]; i >= 0; i--) {
		trail_pos[i] = [x, y, false]; // x, y, visible
	}
	trail_sprite = sprite_index;
	trail_visible = false;


}
