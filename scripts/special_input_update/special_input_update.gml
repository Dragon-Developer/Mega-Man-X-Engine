function special_input_update() {
	// keys, next_key, timer, new_id, pressed
	for (var i = 0; i < ds_list_size(special_input_list); i++)
	{
		var arr = special_input_list[| i];
		var keys = arr[0];
		var next_key = arr[1];
	
		if (keys[next_key] == special_input_result())
		{
			arr[1]++; // Next Key
			next_key = arr[1];
			arr[2] = 24; // Timer
		}
	
		if (next_key >= array_length_1d(keys))
		{
			arr[4] = true; // Pressed
			arr[1] = 0; // Next Key
			arr[2] = 0; // Timer
		}
		else
		{
			arr[4] = false; // Not Pressed
		}
	
		// Timer Update
		if (arr[2] > 0) arr[2]--;
	
		// Timer End
		if (arr[2] == 0)
		{
			arr[1] = 0;
		}
	
		special_input_list[| i] = arr;
	}


}
