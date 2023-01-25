/// @description Returns a string with the first character capitalized.
/// @param str string of text, string
function string_ucfirst() {
	var str, out;
	str = string_lower(argument[0]);
	out = string_upper(string_char_at(str, 1));
	out += string_copy(str, 2, string_length(str) - 1);
	return out;


}
