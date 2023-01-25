function player_get_aim_angle() {
	var arr = [0, 90, 45, -90, -45];
	var angle = arr[player_get_aim_direction()];

	if (dir == 1)
		return angle;

	return 180 - angle; 


}
