function player_check_move(update_dir = true) {
	if (move != 0 && update_dir) {
		dir = move;
		xscale = move;	
	}

	return (move != 0 && move_x(move * walk_speed));

}
