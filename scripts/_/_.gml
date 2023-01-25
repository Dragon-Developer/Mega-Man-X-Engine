function _() {
	if (ds_map_exists(global.dictionary, argument[0]))
	{
		return global.dictionary[? argument[0]];
	}
	return argument[0];


}
