function move_down() {
	var _dist = 10;

	y = floor(y);

	if (argument_count) _dist = argument[0];

	move_contact_block(0, _dist);


}
