function text_set_font() {
	var fnt = argument[0];
	if (fnt != text_fonts.custom)
	{
		var arr = global.text_font_array[fnt];
		global.text_font_sprite = arr[0];
		global.text_font_offset = arr[1];
		global.text_font_width = arr[2];
	}



}
