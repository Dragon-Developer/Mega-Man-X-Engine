/// @description Add a new animation
/// @param sprite
/// @param speed
/// @param x
/// @param y
function animation2_add() {
	animation2_sprite[animation2_num] = argument[0];
	animation2_index[animation2_num] = 0;
	animation2_speed[animation2_num] = argument[1];
	animation2_pos[animation2_num] = [0, 0];
	animation2_show[animation2_num] = false;
	if (argument_count > 3) {
		animation2_pos[animation2_num] = [argument[2], argument[3]];
		animation2_show[animation2_num] = true;
	}
	animation2_num++;


}
