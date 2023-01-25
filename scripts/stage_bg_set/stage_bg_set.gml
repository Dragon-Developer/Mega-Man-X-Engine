function stage_bg_set() {
	stage = argument[0];
	stage_phase = (argument_count > 1 ? argument[1]: 0);
	if (argument_count > 2)
	{
		var arr = argument[2];
		for (var i = 0; i < array_length_1d(arr); i++)
		{
			substates[i] = arr[i]
		}
	}


}
