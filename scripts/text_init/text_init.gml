function text_init() {
	enum text_fonts
	{
		normal,
		big,
		custom
	}
	global.text_font_array[text_fonts.normal] = [spr_text_font_normal, 33, 8];
	global.text_font_array[text_fonts.big] = [spr_text_font_big, 65, 8];

	var arr = global.text_font_array[text_fonts.normal];
	global.text_font_sprite = arr[0];
	global.text_font_offset = arr[1];
	global.text_font_width = arr[2];

	text_set_font(text_fonts.normal);



}
