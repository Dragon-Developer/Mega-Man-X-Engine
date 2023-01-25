/// @description Update subitem based on interval and input
/// @param index
/// @param input
/// @param interval_array
/// @param _teleport
function menu_update_subitem() {
	var _index = argument[0];
	var input_result = argument[1];
	var interval = argument[2];
	var _teleport = (argument_count > 3 ? argument[3] : false);

	if (_teleport) {
		_index += input_result;
		if (_index < interval[0]) {
			_index = interval[1];
		}
		if (_index > interval[1]) {
			_index = interval[0];
		}
		return _index;
	}
	return clamp(_index + input_result, interval[0], interval[1]);


}
