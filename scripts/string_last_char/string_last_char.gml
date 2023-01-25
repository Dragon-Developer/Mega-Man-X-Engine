/// @description Returns the last character of the given string
/// @param string
function string_last_char() {
	var str = argument[0];
	var slength = string_length(str);

	if (slength > 0) {
		return string_char_at(str, slength);
	}

	return "";


}
