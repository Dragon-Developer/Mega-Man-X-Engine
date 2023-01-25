/// @description Returns true if the string contains only digits and false
function string_is_digit() {
	var str = argument[0];
	var slength = string_length(str);
	// For each character in the string
	for (var i = 1; i <= slength; i++) {
		var c = string_char_at(str, i);
		// If it's not a digit, return false
		if !("0" <= c && c <= "9") {
			return false;	
		}
	}
	// Returns false if it's empty, and true if it only has digits
	return (str != "");


}
