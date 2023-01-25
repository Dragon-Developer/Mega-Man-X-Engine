function player_voices_init() {
	// Ignore invalid player echaracters
	if (my_character < 0 || my_character >= ds_list_size(G.player_voices) || os_browser != browser_not_a_browser) exit;
	// Get map ID
	var map = G.player_voices[| my_character];
	// Character Voice Directory
	var voice_directory = "Sounds/Languages/" + string_ucfirst(G.voice_language) + "/" + string_ucfirst(char_name);

	// If this directory doesn't exist
	if (!directory_exists_fixed(working_directory + voice_directory)) {
		log("Directory not found: " + voice_directory);
		exit;
	}

	var files = directory_get_files(working_directory + voice_directory);
	var alength = array_length_1d(files);
	// For each audio file
	for (var i = 0; i < alength; i++) {
		var file = files[i];
		// If it's not a .ogg file, ignore it
		if (string_count(".ogg", file) == 0) continue;

		var action_file = string_replace(file, ".ogg", ""); // Ex: jump0
		var last_char = string_last_char(action_file); // Ex: 0
		var action = action_file; // Ex: jump
		// If the last character is a digit, copy the part without the digit to the "action" variable
		if (string_is_digit(last_char))
			action = string_copy(action, 1, string_length(action) - 1);
		var action_list;
		// Create action list if it doesn't exist
		if (!ds_map_exists(map, action))
			ds_map_add_list(map, action, ds_list_create());
		// Get action list id
		action_list = map[? action];
		// Add current sound to the action list
		var fpath = working_directory + voice_directory + "/" + file;
		var audio_index = audio_create_stream(fpath);
		ds_list_add(action_list, audio_index);
		//show_message_async("Streamed (" + string(audio_index) + "): " + fpath);
	}
	// Get sounds that may or may not play depending on random factors
	var fpath = working_directory + voice_directory + "/config.txt";
	if (!file_exists(fpath)) exit;

	file = file_text_open_read(fpath);
	while (!file_text_eof(file)) {
		var action = file_text_readln(file);
		var action_list;
		// Create action list if it doesn't exist
		if (!ds_map_exists(map, action))
			ds_map_add_list(map, action, ds_list_create());
		// Get action list id
		action_list = map[? action];
		ds_list_add(action_list, noone);
	}
	// Close
	file_text_close(file);


}
