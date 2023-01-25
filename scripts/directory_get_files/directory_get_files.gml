function directory_get_files() {
	var arr = [];
	var index = 0;
	var directory = argument[0];
	if (os_type != os_android) {
		for (var f = file_find_first(directory + "\\*", 0); f != ""; f = file_find_next()) {
			arr[index++] = f;
		}
		file_find_close();
		return arr;
	} else {
		var fpath = directory + "/android.txt";
		//show_message_async(fpath);
		if (file_exists(fpath)) {
			var file = file_text_open_read(fpath);
			while (!file_text_eof(file)) {
				arr[index++] = file_text_read_string(file);
				file_text_readln(file);
			}
			file_text_close(file);
		}
	}
	return arr;


}
