function menu_set_state() {
	state_next = argument[0];

	if (state_next < array_length(page_items))
	{
		items_next = page_items[state_next];
	}

	input_timer = (argument_count > 2 ? argument[2] : 30);
	wait_t = (argument_count > 1 ? argument[1] : 0);
	if (wait_t == 0)
	{
		var tran = transition_create(transition_types.fade_out_and_fade_in);
		tran.transition_limit = input_timer;
		tran.wait_timer = 10;
		timer += tran.wait_timer;
	}
	timer += floor(input_timer / 2);


}
