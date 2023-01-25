/// @function		array_contains
/// @description	Check if the array contains this value
/// @param {Array}	array
/// @param {Any*}	value
function array_contains(arr, val) {
	for (var i = 0, len = array_length(arr); i < len; i++)
		if (arr[i] == val) return true;
	return false;
}

/// @function		array_to_list
/// @description	Generate a DS List from this Array
/// @param {Array}	array
function array_to_list(arr) {
	var list = ds_list_create();
	for (var i = array_length(arr) - 1; i >= 0; i--) {
		list[| i] = arr[i];
	}
	return list;
}
/// @function		array_find
/// @description	Find position from this value
/// @param {Array}	array
/// @param {Any*}		value
function array_find(arr, val) {
	for (var i = 0, len = array_length(arr); i < len; i++)
		if (arr[i] == val) return i;
	return -1;
}
