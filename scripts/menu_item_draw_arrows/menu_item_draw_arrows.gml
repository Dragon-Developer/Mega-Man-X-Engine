function menu_item_draw_arrows() {
	var _x = argument[0];
	var _y = argument[1];
	var k = argument[2];
	var subitem = argument[3];
	var _color = (argument_count > 4 ? argument[4] : colors.blue);
	var sublength = array_length_1d(subitem);
	var arrows = [k > 0 ? "<" : " ",
					k < sublength - 1 ? ">" : " "];
	draw_string_center(_x, _y, arrows[0] + string_repeat(" ", string_length(subitem[k]) + 2) + arrows[1], _color)


}
