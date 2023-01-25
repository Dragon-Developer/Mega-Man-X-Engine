/// @param argument
/// @param index
/// @param default_value
function argument_get() {
	var arg = argument[0];

	if (array_length(arg) > argument[1]) return arg[argument[1]];

	return argument[2];


}
