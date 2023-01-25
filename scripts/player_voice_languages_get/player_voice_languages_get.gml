function player_voice_languages_get() {
	// Voice Language Directory
	var lang_directory = "Sounds\\Languages";
	var arr = [];
	var index = 0;
	if (G.mobile) {
		var fpath = lang_directory + "\\languages.txt";
		if (!file_exists(fpath)) exit;

		var file = file_text_open_read(fpath);
		while (!file_text_eof(file)) {
			var lang = file_text_readln(file);
			arr[index++] = lang;
		}
	
		arr[index++] = "NONE";
		return arr;
	}
	// For each file/folder
	for (var f = file_find_first(lang_directory + "\\*", fa_directory); f != ""; f = file_find_next()) {
		// Check if it's a folder
		if (directory_exists(lang_directory + "\\" + f + "\\")) {
			arr[index++] = string_upper(f);
		}
	}
	file_find_close();
	arr[index++] = "NONE";
	return arr;


}
