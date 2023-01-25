function player_fix_x_axis(_dir = self.dir) {
	while (!is_place_free(x, y))
	{
		x -= _dir;
	}
}
