function menu_update_item_v() {
	var _teleport = (argument_count > 0 ? argument[0] : false);
	if (_teleport)
	{
		selected_item += vinput_p;
		if (selected_item < 0)
		{
			selected_item = array_length_1d(items) - 1;
		}
		if (selected_item >= array_length_1d(items))
		{
			selected_item = 0;
		}
	}
	else
	{
		selected_item = clamp(selected_item + vinput_p, 0, array_length_1d(items) - 1)
	}


}
