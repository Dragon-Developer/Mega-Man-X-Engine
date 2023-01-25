function player_can_jump() {
	var can_jump_air = (double_jump_unlocked
			&& dash_air_count < dash_air_limit 
			&& !is_on_floor()
			&& (jumpable_wall_dir() == 0)
			&& !is_on_ceil());
	if (is_on_floor())
		return 1;
	if (can_jump_air)
		return 2;
	return 0;


}
