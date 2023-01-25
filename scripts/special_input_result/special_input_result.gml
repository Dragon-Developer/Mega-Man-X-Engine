function special_input_result() {
	if (key_shoot2) return SHOOT_2;
	if (key_shoot) return SHOOT_1;
	if (key_left && key_down) return DOWN_LEFT;
	if (key_right && key_down) return DOWN_RIGHT;
	if (key_up && key_down) return UP_LEFT;
	if (key_up && key_right) return UP_RIGHT;
	if (key_up) return UP;
	if (key_down) return DOWN;
	if (key_left) return LEFT;
	if (key_right) return RIGHT;
	return 0;


}
