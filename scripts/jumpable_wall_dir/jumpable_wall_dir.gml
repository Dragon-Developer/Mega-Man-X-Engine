function jumpable_wall_dir() {
	if (place_meeting(x - 9, y, obj_square_parent) && place_meeting(x - 9, y - 8, obj_square_parent) && !place_meeting(x - 9, y, obj_block_not_wall))
		return -1;
	if (place_meeting(x + 9, y, obj_square_parent) && place_meeting(x + 9, y - 8, obj_square_parent) && !place_meeting(x + 9, y, obj_block_not_wall))
		return 1;
	
	return 0;


}
