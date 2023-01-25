///@function is_place_free(x,y)
function is_place_free(_x, _y) {
	return !place_meeting(_x, _y, obj_block_parent);
}
