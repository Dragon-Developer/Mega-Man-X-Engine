function menu_update_item_click() {
	var clicked_item = menu_get_clicked_item();

	if (clicked_item != -1)
	{
		enter = true;
		selected_item = clicked_item;
	}


}
