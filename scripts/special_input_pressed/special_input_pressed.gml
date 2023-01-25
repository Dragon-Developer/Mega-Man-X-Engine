function special_input_pressed() {
	var index = argument[0];
	var first_index = index;
	while(index < ds_list_size(special_input_list))
	{
		var list = special_input_list[| index];
	
		if (list[3] == first_index)
		{
			if (list[4]) return true;
		}
		else
		{
			return false;	
		}
	
		index++;
	}
	return false;


}
