var t = timer++;
for (var i = 0; i < array_length(lines); i++) {
	var line = lines[i];
	if (t >= line.start && string_length(line.text) != string_length(line.text_draw)) {
		if (t mod 4 == 0) {
			line.text_draw += string_char_at(line.text, string_length(line.text_draw) + 1);	
		}
	}
}