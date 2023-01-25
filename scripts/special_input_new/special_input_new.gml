/// @param keys
function special_input_new() {
	var new_id = ds_list_size(special_input_list);

	for (var i = 0; i < argument_count; i++)
	{
		var keys = argument[i];

		ds_list_add(special_input_list, [keys, 0, 0, new_id, 0]);
	}

	return new_id;


}
