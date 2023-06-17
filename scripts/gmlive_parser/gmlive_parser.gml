// GMLive.gml (c) YellowAfterlife, 2017+
// PLEASE DO NOT FORGET to remove paid extensions from your project when publishing the source code!
// And if you are using git, you can exclude GMLive by adding
// `scripts/GMLive*` and `extensions/GMLive/` lines to your `.gitignore`.
// Feather disable all

// tokenizes the source code!
#region gml.parser

if (live_enabled) 
function gml_parser(l_src) constructor {
	static h_tokens = undefined; /// @is {array<gml_token>}
	static h_token_count = undefined; /// @is {int}
	static h_macros = undefined; /// @is {array<gml_parser_macro>}
	static h_curr_macro = undefined; /// @is {gml_parser_macro}
	static h_source = undefined; /// @is {gml_source}
	static h_to_string = function() {
		return "GmlParser(src:\"" + self.h_source.h_name + "\")";
	}
	static h_run = function(l_temStart) {
		if (l_temStart == undefined) l_temStart = -1;
		if (false) show_debug_message(argument[0]);
		var l__gthis = self;
		var l_src = self.h_source;
		var l_z, l_s, l_i, l_n, l_row, l_rowStart, l_pos, l_tks;
		var l_ver = l_src.h_version;
		if (l_ver == undefined) {
			l_ver = gml_parser_default_version;
			l_src.h_version = l_ver;
		}
		gml_parser_curr_version = l_ver;
		var l_out = ds_list_create();
		var l__out_tk;
		if (l_temStart >= 0) {
			l_row = gml_parser_tem_row;
			l_rowStart = gml_parser_tem_row_start;
			l_pos = l_temStart;
		} else {
			l_row = 1;
			l_rowStart = 0;
			l_pos = 0;
		}
		var l_code = l_src.h_code;
		var l_len = string_byte_length(l_code);
		var l_buf = gml_parser_src_buf;
		var l_str = gml_parser_str_buf;
		if (l_temStart < 0) {
			if (buffer_get_size(l_str) < l_len) buffer_resize(l_str, l_len);
			buffer_seek(l_str, buffer_seek_start, 0);
			buffer_write(l_str, buffer_string, l_code);
			if (buffer_get_size(l_buf) < l_len) buffer_resize(l_buf, l_len);
			buffer_copy(gml_parser_str_buf, 0, l_len, l_buf, 0);
		}
		var l_sub_buf = gml_parser_buf_sub_buf;
		var l_checkLine = false;
		var l_brackets = 0;
		while (l_pos < l_len) {
			var l_c = buffer_peek(l_buf, l_pos++, buffer_u8);
			if (self.h_curr_macro != undefined) switch (l_c) {
				case 92:
					l_z = true;
					while (l_pos < l_len && l_z) {
						l_c = buffer_peek(l_buf, l_pos++, buffer_u8);
						switch (l_c) {
							case 47:
								if (buffer_peek(l_buf, l_pos, buffer_u8) == 47) {
									while (l_pos < l_len) {
										l_c = buffer_peek(l_buf, l_pos, buffer_u8);
										if (l_c == 13 || l_c == 10) break;
										l_pos++;
									}
								} else if (buffer_peek(l_buf, l_pos, buffer_u8) == 42) {
									return gml_parser_error("Should not be having block comments after a \\ in a macro", new gml_pos(l_src, l_row, l_pos - l_rowStart), l_out);
								} else return gml_parser_error("Unexpected character `" + chr(l_c) + "` after a \\ in a macro", new gml_pos(l_src, l_row, l_pos - l_rowStart), l_out);
								break;
							case 9: case 32: continue;
							case 13: if (buffer_peek(l_buf, l_pos, buffer_u8) == 10) l_pos++; break;
							case 10: break;
							default: return gml_parser_error("Unexpected character `" + chr(l_c) + "` after a \\ in a macro", new gml_pos(l_src, l_row, l_pos - l_rowStart), l_out);
						}
						break;
					}
					continue;
				case 47:
					if (buffer_peek(l_buf, l_pos, buffer_u8) == 47) {
						l_z = false;
						while (l_pos < l_len) {
							l_c = buffer_peek(l_buf, l_pos, buffer_u8);
							if (l_c == 13 || l_c == 10) break;
							if (l_c == 92) l_z = true;
							l_pos++;
						}
						if (l_z) {
							if (buffer_peek(l_buf, l_pos, buffer_u8) == 13) l_pos++;
							if (buffer_peek(l_buf, l_pos, buffer_u8) == 10) l_pos++;
						}
					} else if (buffer_peek(l_buf, l_pos, buffer_u8) == 42) {
						l_z = false;
						while (l_pos < l_len) {
							l_c = buffer_peek(l_buf, l_pos, buffer_u8);
							if (l_c == 92) {
								l_z = true;
								continue;
							}
							if (l_c == 13 || l_c == 10) {
								l_pos++;
								if (l_c == 13 && buffer_peek(l_buf, l_pos, buffer_u8) == 10) l_pos++;
								if (!l_z) return gml_parser_error("Multi-line comments inside macros must use \\ before line end", new gml_pos(l_src, l_row, l_pos - l_rowStart), l_out);
								l_z = false;
							}
							l_pos++;
						}
					}
					break;
				case 10: case 13:
					self.h_curr_macro = undefined;
					continue;
			}
			switch (l_c) {
				case 9: case 13: case 32: continue;
				case 10:
					if (l_checkLine) {
						l_i = ds_list_size(l_out) - 1;
						var l__g = ds_list_find_value(l_out, l_i);
						if (l__g.__enumIndex__/* gml_token */ == 0/* header */) {
							if (l__g.h_lb == false) ds_list_set(l_out, l_i, gml_token_header(l__g.h_d, l__g.h_name, true));
						}
					}
					l_row++;
					l_rowStart = l_pos;
					continue;
			}
			var l_start = l_pos - 1;
			var l_d = new gml_pos(l_src, l_row, l_pos - l_rowStart);
			var l_op;
			switch (l_c) {
				case 59:
					l__out_tk = gml_token_semico(l_d);
					if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
					break;
				case 44:
					l__out_tk = gml_token_comma(l_d);
					if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
					break;
				case 46:
					l_c = buffer_peek(l_buf, l_pos, buffer_u8);
					if (l_c >= 48 && l_c <= 57) {
						while (true) {
							l_pos++;
							l_c = buffer_peek(l_buf, l_pos, buffer_u8);
							if (!(l_c >= 48 && l_c <= 57)) break;
						}
						l_s = gml_parser_buf_sub(l_buf, l_sub_buf, l_start, l_pos);
						l__out_tk = gml_token_number(l_d, gml_std_Std_parseFloat(l_s), l_s);
						if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
					} else {
						l__out_tk = gml_token_period(l_d);
						if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
					}
					break;
				case 58:
					l__out_tk = gml_token_colon(l_d);
					if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
					break;
				case 63:
					if (buffer_peek(l_buf, l_pos, buffer_u8) == 63) {
						l_pos++;
						if (buffer_peek(l_buf, l_pos, buffer_u8) == 61) {
							l_pos++;
							l__out_tk = gml_token_null_co_set(l_d);
							if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
						} else {
							l__out_tk = gml_token_null_co(l_d);
							if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
						}
					} else {
						l__out_tk = gml_token_qmark(l_d);
						if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
					}
					break;
				case 64:
					if (l_ver.h_has_literal_strings) {
						l_c = buffer_peek(l_buf, l_pos, buffer_u8);
						if (l_c == 34 || l_c == 39) {
							l_pos++;
							l_n = l_pos;
							l_i = buffer_peek(l_buf, l_pos, buffer_u8);
							if (l_c >= 192) {
								if (l_c >= 224) {
									if (l_c >= 240) l_rowStart += 3; else l_rowStart += 2;
								} else l_rowStart++;
							}
							while (l_i != l_c && l_pos < l_len) {
								if (l_i == 10) {
									l_row++;
									l_rowStart = l_pos;
								}
								l_pos++;
								l_i = buffer_peek(l_buf, l_pos, buffer_u8);
								if (l_c >= 192) {
									if (l_c >= 224) {
										if (l_c >= 240) l_rowStart += 3; else l_rowStart += 2;
									} else l_rowStart++;
								}
							}
							if (l_pos < l_len) {
								l_s = gml_parser_buf_sub(l_buf, l_sub_buf, l_n, l_pos++);
							} else {
								ds_list_destroy(l_out);
								gml_parser_error("Unclosed string", l_d, l_out);
								l_s = undefined;
							}
							l__out_tk = gml_token_cstring(l_d, l_s);
							if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
						} else {
							l__out_tk = gml_token_at_sign(l_d);
							if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
						}
					} else {
						l__out_tk = gml_token_at_sign(l_d);
						if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
					}
					break;
				case 61:
					if (buffer_peek(l_buf, l_pos, buffer_u8) == 61) {
						l_pos++;
						l__out_tk = gml_token_bin_op(l_d, 64);
						if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
					} else {
						l__out_tk = gml_token_set_op(l_d, -1);
						if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
					}
					break;
				case 43:
					switch (buffer_peek(l_buf, l_pos, buffer_u8)) {
						case 61:
							l_pos++;
							l__out_tk = gml_token_set_op(l_d, 16);
							if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
							break;
						case 43:
							l_pos++;
							l__out_tk = gml_token_adjfix(l_d, true);
							if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
							break;
						default:
							l__out_tk = gml_token_bin_op(l_d, 16);
							if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
					}
					break;
				case 45:
					switch (buffer_peek(l_buf, l_pos, buffer_u8)) {
						case 61:
							l_pos++;
							l__out_tk = gml_token_set_op(l_d, 17);
							if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
							break;
						case 45:
							l_pos++;
							l__out_tk = gml_token_adjfix(l_d, false);
							if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
							break;
						default:
							l__out_tk = gml_token_bin_op(l_d, 17);
							if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
					}
					break;
				case 47:
					switch (buffer_peek(l_buf, l_pos, buffer_u8)) {
						case 47:
							l_pos++;
							l_start = l_pos;
							while (l_pos < l_len) {
								l_i = buffer_peek(l_buf, l_pos, buffer_u8);
								if (l_i == 10 || l_i == 13) break; else l_pos++;
							}
							break;
						case 42:
							l_pos++;
							while (true) {
								l_c = buffer_peek(l_buf, l_pos, buffer_u8);
								if (l_c >= 192) {
									if (l_c >= 224) {
										if (l_c >= 240) l_rowStart += 3; else l_rowStart += 2;
									} else l_rowStart++;
								}
								if (l_c == 10) {
									l_row++;
									l_rowStart = l_pos;
								}
								l_pos++;
								if (l_pos < l_len) {
									l_z = true;
									if (l_c == 42) {
										if (buffer_peek(l_buf, l_pos, buffer_u8) == 47) l_z = false;
									}
								} else l_z = false;
								if (!l_z) break;
							}
							l_i = l_pos;
							l_z = true;
							l_pos++;
							while (++l_i < l_len) {
								switch (buffer_peek(l_buf, l_i, buffer_u8)) {
									case 9: case 32: continue;
									case 10: case 13: break;
									default: l_z = false;
								}
								break;
							}
							break;
						case 61:
							l_pos++;
							l__out_tk = gml_token_set_op(l_d, 1);
							if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
							break;
						default:
							l_op = 1;
							if (buffer_peek(l_buf, l_pos, buffer_u8) == 61) {
								l_pos++;
								l__out_tk = gml_token_set_op(l_d, l_op);
								if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
							} else {
								l__out_tk = gml_token_bin_op(l_d, l_op);
								if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
							}
					}
					break;
				case 42:
					l_op = 0;
					if (buffer_peek(l_buf, l_pos, buffer_u8) == 61) {
						l_pos++;
						l__out_tk = gml_token_set_op(l_d, l_op);
						if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
					} else {
						l__out_tk = gml_token_bin_op(l_d, l_op);
						if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
					}
					break;
				case 37:
					l_op = 2;
					if (buffer_peek(l_buf, l_pos, buffer_u8) == 61) {
						l_pos++;
						l__out_tk = gml_token_set_op(l_d, l_op);
						if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
					} else {
						l__out_tk = gml_token_bin_op(l_d, l_op);
						if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
					}
					break;
				case 38:
					if (buffer_peek(l_buf, l_pos, buffer_u8) == 38) {
						l_pos++;
						l_op = 80;
						if (buffer_peek(l_buf, l_pos, buffer_u8) == 61) {
							l_pos++;
							l__out_tk = gml_token_set_op(l_d, l_op);
							if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
						} else {
							l__out_tk = gml_token_bin_op(l_d, l_op);
							if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
						}
					} else {
						l_op = 49;
						if (buffer_peek(l_buf, l_pos, buffer_u8) == 61) {
							l_pos++;
							l__out_tk = gml_token_set_op(l_d, l_op);
							if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
						} else {
							l__out_tk = gml_token_bin_op(l_d, l_op);
							if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
						}
					}
					break;
				case 124:
					if (buffer_peek(l_buf, l_pos, buffer_u8) == 124) {
						l_pos++;
						l_op = 96;
						if (buffer_peek(l_buf, l_pos, buffer_u8) == 61) {
							l_pos++;
							l__out_tk = gml_token_set_op(l_d, l_op);
							if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
						} else {
							l__out_tk = gml_token_bin_op(l_d, l_op);
							if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
						}
					} else {
						l_op = 48;
						if (buffer_peek(l_buf, l_pos, buffer_u8) == 61) {
							l_pos++;
							l__out_tk = gml_token_set_op(l_d, l_op);
							if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
						} else {
							l__out_tk = gml_token_bin_op(l_d, l_op);
							if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
						}
					}
					break;
				case 94:
					if (buffer_peek(l_buf, l_pos, buffer_u8) == 94) {
						l_pos++;
						l_op = 65;
						if (buffer_peek(l_buf, l_pos, buffer_u8) == 61) {
							l_pos++;
							l__out_tk = gml_token_set_op(l_d, l_op);
							if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
						} else {
							l__out_tk = gml_token_bin_op(l_d, l_op);
							if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
						}
					} else {
						l_op = 50;
						if (buffer_peek(l_buf, l_pos, buffer_u8) == 61) {
							l_pos++;
							l__out_tk = gml_token_set_op(l_d, l_op);
							if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
						} else {
							l__out_tk = gml_token_bin_op(l_d, l_op);
							if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
						}
					}
					break;
				case 62:
					switch (buffer_peek(l_buf, l_pos, buffer_u8)) {
						case 61:
							l_pos++;
							l__out_tk = gml_token_bin_op(l_d, 69);
							if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
							break;
						case 62:
							l_pos++;
							l_op = 33;
							if (buffer_peek(l_buf, l_pos, buffer_u8) == 61) {
								l_pos++;
								l__out_tk = gml_token_set_op(l_d, l_op);
								if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
							} else {
								l__out_tk = gml_token_bin_op(l_d, l_op);
								if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
							}
							break;
						default:
							l__out_tk = gml_token_bin_op(l_d, 68);
							if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
					}
					break;
				case 60:
					switch (buffer_peek(l_buf, l_pos, buffer_u8)) {
						case 61:
							l_pos++;
							l__out_tk = gml_token_bin_op(l_d, 67);
							if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
							break;
						case 60:
							l_pos++;
							l_op = 32;
							if (buffer_peek(l_buf, l_pos, buffer_u8) == 61) {
								l_pos++;
								l__out_tk = gml_token_set_op(l_d, l_op);
								if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
							} else {
								l__out_tk = gml_token_bin_op(l_d, l_op);
								if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
							}
							break;
						case 62:
							l_pos++;
							l_op = 65;
							if (buffer_peek(l_buf, l_pos, buffer_u8) == 61) {
								l_pos++;
								l__out_tk = gml_token_set_op(l_d, l_op);
								if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
							} else {
								l__out_tk = gml_token_bin_op(l_d, l_op);
								if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
							}
							break;
						default:
							l__out_tk = gml_token_bin_op(l_d, 66);
							if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
					}
					break;
				case 33:
					if (buffer_peek(l_buf, l_pos, buffer_u8) == 61) {
						l_pos++;
						l_op = 65;
						if (buffer_peek(l_buf, l_pos, buffer_u8) == 61) {
							l_pos++;
							l__out_tk = gml_token_set_op(l_d, l_op);
							if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
						} else {
							l__out_tk = gml_token_bin_op(l_d, l_op);
							if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
						}
					} else {
						l__out_tk = gml_token_un_op(l_d, 1);
						if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
					}
					break;
				case 126:
					l__out_tk = gml_token_un_op(l_d, 2);
					if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
					break;
				case 40:
					l__out_tk = gml_token_par_open(l_d);
					if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
					break;
				case 41:
					l__out_tk = gml_token_par_close(l_d);
					if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
					break;
				case 91:
					l__out_tk = gml_token_sqb_open(l_d);
					if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
					break;
				case 93:
					l__out_tk = gml_token_sqb_close(l_d);
					if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
					break;
				case 123:
					l_brackets++;
					l__out_tk = gml_token_cub_open(l_d);
					if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
					break;
				case 125:
					l_brackets--;
					if (l_temStart >= 0 && l_brackets < 0) {
						if (l_temStart >= 0) {
							gml_parser_tem_end = l_pos;
							gml_parser_tem_row = l_row;
							gml_parser_tem_row_start = l_rowStart;
						} else {
							l__gthis.h_curr_macro = undefined;
							if (l_src.h___eof == undefined) l_src.h___eof = new gml_pos(l_src, l_row, l_pos - l_rowStart);
						}
						l_n = ds_list_size(l_out);
						l_tks = array_create(l_n);
						for (l_i = 0; l_i < l_n; l_i++) {
							l_tks[@l_i] = ds_list_find_value(l_out, l_i);
							l_tks[l_i].__enumName__ = gml_std_Type_enumConstructor(l_tks[l_i]);
						}
						l__gthis.h_tokens = l_tks;
						l__gthis.h_token_count = ds_list_size(l_out);
						ds_list_destroy(l_out);
						return l_tks;
					} else {
						l__out_tk = gml_token_cub_close(l_d);
						if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
					}
					break;
				case 34:
					if (l_ver.h_has_string_escape_characters) {
						l_z = true;
						l_c = buffer_peek(l_buf, l_pos, buffer_u8);
						if (l_c >= 192) {
							if (l_c >= 224) {
								if (l_c >= 240) l_rowStart += 3; else l_rowStart += 2;
							} else l_rowStart++;
						}
						while (l_pos < l_len) {
							switch (l_c) {
								case 34: break;
								case 10: case 13:
									ds_list_destroy(l_out);
									return gml_parser_error("Unclosed string", l_d, l_out);
								case 92:
									if (l_z) {
										l_z = false;
										buffer_seek(l_str, buffer_seek_start, 0);
									}
									l_s = gml_parser_buf_sub(l_buf, l_sub_buf, l_start + 1, l_pos);
									buffer_write(l_str, buffer_text, l_s);
									l_pos++;
									l_c = buffer_peek(l_buf, l_pos, buffer_u8);
									if (l_c >= 192) {
										if (l_c >= 224) {
											if (l_c >= 240) l_rowStart += 3; else l_rowStart += 2;
										} else l_rowStart++;
									}
									switch (l_c) {
										case 114: buffer_write(l_str, buffer_u8, 13); break;
										case 110: buffer_write(l_str, buffer_u8, 10); break;
										case 116: buffer_write(l_str, buffer_u8, 9); break;
										case 98: buffer_write(l_str, buffer_u8, 8); break;
										case 102: buffer_write(l_str, buffer_u8, 12); break;
										case 118: buffer_write(l_str, buffer_u8, 11); break;
										case 92: buffer_write(l_str, buffer_u8, 92); break;
										case 97: buffer_write(l_str, buffer_u8, 7); break;
										case 10:
											l_row++;
											l_rowStart = l_pos;
											break;
										case 117: case 120:
											l_n = 0;
											if (l_c == 117) l_i = 12; else l_i = 4;
											while (l_i >= 0) {
												l_pos++;
												l_c = buffer_peek(l_buf, l_pos, buffer_u8);
												if (l_c >= 48 && l_c <= 57) {
													l_c -= 48;
												} else if (l_c >= 65 && l_c <= 70) {
													l_c -= 55;
												} else if (l_c >= 97 && l_c <= 102) {
													l_c -= 87;
												} else l_c = 0;
												l_n |= (l_c << l_i);
												l_i -= 4;
											}
											if (l_n <= 127) {
												buffer_write(l_str, buffer_u8, l_n);
											} else if (l_n <= 2047) {
												buffer_write(l_str, buffer_u8, (192 | (l_n >> 6)));
												buffer_write(l_str, buffer_u8, (128 | (l_n & 63)));
											} else if (l_n <= 65535) {
												buffer_write(l_str, buffer_u8, (192 | (l_n >> 12)));
												buffer_write(l_str, buffer_u8, (128 | ((l_n >> 6) & 63)));
												buffer_write(l_str, buffer_u8, (128 | (l_n & 63)));
											} else {
												buffer_write(l_str, buffer_u8, (192 | (l_n >> 18)));
												buffer_write(l_str, buffer_u8, (128 | ((l_n >> 12) & 63)));
												buffer_write(l_str, buffer_u8, (128 | ((l_n >> 6) & 63)));
												buffer_write(l_str, buffer_u8, (128 | (l_n & 63)));
											}
											break;
										default:
											buffer_write(l_str, buffer_u8, l_c);
											if (l_c == 13) {
												l_pos++;
												if (buffer_peek(l_buf, l_pos, buffer_u8) == 10) buffer_write(l_str, buffer_u8, 10); else l_pos--;
											}
									}
									l_start = l_pos;
									l_pos++;
									l_c = buffer_peek(l_buf, l_pos, buffer_u8);
									if (l_c >= 192) {
										if (l_c >= 224) {
											if (l_c >= 240) l_rowStart += 3; else l_rowStart += 2;
										} else l_rowStart++;
									}
									continue;
								default:
									l_pos++;
									l_c = buffer_peek(l_buf, l_pos, buffer_u8);
									if (l_c >= 192) {
										if (l_c >= 224) {
											if (l_c >= 240) l_rowStart += 3; else l_rowStart += 2;
										} else l_rowStart++;
									}
									continue;
							}
							break;
						}
						if (l_pos >= l_len) {
							ds_list_destroy(l_out);
							return gml_parser_error("Unclosed string", l_d, l_out);
						} else l_pos++;
						if (l_z) {
							l_s = gml_parser_buf_sub(l_buf, l_sub_buf, l_start + 1, l_pos - 1);
						} else {
							l_s = gml_parser_buf_sub(l_buf, l_sub_buf, l_start + 1, l_pos - 1);
							buffer_write(l_str, buffer_text, l_s);
							buffer_write(l_str, buffer_u8, 0);
							buffer_seek(l_str, buffer_seek_start, 0);
							l_s = buffer_read(l_str, buffer_string);
						}
						l__out_tk = gml_token_cstring(l_d, l_s);
						if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
					} else {
						l_n = l_pos;
						l_i = buffer_peek(l_buf, l_pos, buffer_u8);
						if (l_c >= 192) {
							if (l_c >= 224) {
								if (l_c >= 240) l_rowStart += 3; else l_rowStart += 2;
							} else l_rowStart++;
						}
						while (l_i != l_c && l_pos < l_len) {
							if (l_i == 10) {
								l_row++;
								l_rowStart = l_pos;
							}
							l_pos++;
							l_i = buffer_peek(l_buf, l_pos, buffer_u8);
							if (l_c >= 192) {
								if (l_c >= 224) {
									if (l_c >= 240) l_rowStart += 3; else l_rowStart += 2;
								} else l_rowStart++;
							}
						}
						if (l_pos < l_len) {
							l_s = gml_parser_buf_sub(l_buf, l_sub_buf, l_n, l_pos++);
						} else {
							ds_list_destroy(l_out);
							gml_parser_error("Unclosed string", l_d, l_out);
							l_s = undefined;
						}
						if (l_s == undefined) return undefined;
						l__out_tk = gml_token_cstring(l_d, gml_parser_buf_sub(l_buf, l_sub_buf, l_start + 1, l_pos - 1));
						if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
					}
					break;
				case 39:
					if (l_ver.h_has_string_escape_characters) {
						ds_list_destroy(l_out);
						return gml_parser_error("Single quotes are not allowed for strings.", l_d, l_out);
					} else {
						l_n = l_pos;
						l_i = buffer_peek(l_buf, l_pos, buffer_u8);
						if (l_c >= 192) {
							if (l_c >= 224) {
								if (l_c >= 240) l_rowStart += 3; else l_rowStart += 2;
							} else l_rowStart++;
						}
						while (l_i != l_c && l_pos < l_len) {
							if (l_i == 10) {
								l_row++;
								l_rowStart = l_pos;
							}
							l_pos++;
							l_i = buffer_peek(l_buf, l_pos, buffer_u8);
							if (l_c >= 192) {
								if (l_c >= 224) {
									if (l_c >= 240) l_rowStart += 3; else l_rowStart += 2;
								} else l_rowStart++;
							}
						}
						if (l_pos < l_len) {
							l_s = gml_parser_buf_sub(l_buf, l_sub_buf, l_n, l_pos++);
						} else {
							ds_list_destroy(l_out);
							gml_parser_error("Unclosed string", l_d, l_out);
							l_s = undefined;
						}
						if (l_s == undefined) return undefined;
						l__out_tk = gml_token_cstring(l_d, gml_parser_buf_sub(l_buf, l_sub_buf, l_start + 1, l_pos - 1));
						if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
					}
					break;
				case 35:
					l_start = l_pos;
					while (l_pos < l_len) {
						l_c = buffer_peek(l_buf, l_pos, buffer_u8);
						if (l_c == 95 || l_c >= 97 && l_c <= 122 || l_c >= 65 && l_c <= 90 || l_c >= 48 && l_c <= 57) l_pos++; else break;
					}
					var l_ident = gml_parser_buf_sub(l_buf, l_sub_buf, l_start, l_pos);
					switch (l_ident) {
						case "define":
							l_start = l_pos;
							while (l_pos < l_len) {
								l_c = buffer_peek(l_buf, l_pos, buffer_u8);
								if (l_c == 32 || l_c == 9) l_pos++; else break;
							}
							if ((l_c == 95 || l_c >= 97 && l_c <= 122 || l_c >= 65 && l_c <= 90) && l_pos < l_len) {
								l_start = l_pos;
								l_pos++;
								while (l_pos < l_len) {
									l_c = buffer_peek(l_buf, l_pos, buffer_u8);
									if (l_c == 95 || l_c >= 97 && l_c <= 122 || l_c >= 65 && l_c <= 90 || l_c >= 48 && l_c <= 57) l_pos++; else break;
								}
								l__out_tk = gml_token_header(l_d, gml_parser_buf_sub(l_buf, l_sub_buf, l_start, l_pos), false);
								if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
								l_checkLine = true;
							} else {
								ds_list_destroy(l_out);
								return gml_parser_error("Expected a script name", l_d, l_out);
							}
							break;
						case "macro":
							var l_name, l_config;
							if (l_ver.h_expr_macros) {
								l__out_tk = gml_token_macro_start(l_d);
								if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
							} else {
								l_name = undefined;
								l_config = undefined;
								while (l_pos < l_len) {
									var l_c1 = buffer_peek(l_buf, l_pos, buffer_u8);
									if (l_c1 == 32 || l_c1 == 9) l_pos++; else break;
								}
								var l_tmp;
								if (l_pos >= l_len) {
									ds_list_destroy(l_out);
									gml_parser_error("Expected a macro name", l_d, l_out);
									l_tmp = true;
								} else {
									l_c = buffer_peek(l_buf, l_pos, buffer_u8);
									if ((l_c == 95 || l_c >= 97 && l_c <= 122 || l_c >= 65 && l_c <= 90)) {
										l_start = l_pos;
										l_pos++;
										while (l_pos < l_len) {
											var l_c2 = buffer_peek(l_buf, l_pos, buffer_u8);
											if (l_c2 == 95 || l_c2 >= 97 && l_c2 <= 122 || l_c2 >= 65 && l_c2 <= 90 || l_c2 >= 48 && l_c2 <= 57) l_pos++; else break;
										}
										l_name = gml_parser_buf_sub(l_buf, l_sub_buf, l_start, l_pos);
										while (l_pos < l_len) {
											var l_c3 = buffer_peek(l_buf, l_pos, buffer_u8);
											if (l_c3 == 32 || l_c3 == 9) l_pos++; else break;
										}
										l_config = undefined;
										if (buffer_peek(l_buf, l_pos, buffer_u8) == 58) {
											l_pos++;
											l_config = l_name;
											while (l_pos < l_len) {
												var l_c4 = buffer_peek(l_buf, l_pos, buffer_u8);
												if (l_c4 == 32 || l_c4 == 9) l_pos++; else break;
											}
											l_start = l_pos;
											while (l_pos < l_len) {
												var l_c5 = buffer_peek(l_buf, l_pos, buffer_u8);
												if (l_c5 == 95 || l_c5 >= 97 && l_c5 <= 122 || l_c5 >= 65 && l_c5 <= 90 || l_c5 >= 48 && l_c5 <= 57) l_pos++; else break;
											}
											l_name = gml_parser_buf_sub(l_buf, l_sub_buf, l_start, l_pos);
										}
										l_tmp = false;
									} else {
										ds_list_destroy(l_out);
										gml_parser_error("Expected a macro name", l_d, l_out);
										l_tmp = true;
									}
								}
								if (l_tmp) return undefined;
								self.h_curr_macro = new gml_parser_macro(l_name, l_config, l_d);
								array_push(self.h_macros, self.h_curr_macro);
							}
							break;
						case "endregion": case "region":
							while (l_pos < l_len) {
								l_i = buffer_peek(l_buf, l_pos, buffer_u8);
								if (l_i == 10 || l_i == 13) break; else l_pos++;
							}
							break;
						default:
							l_z = true;
							if (string_length(l_ident) == 6) {
								l_z = false;
								l_n = -1;
								l_i = 0;
								while (++l_n < 6) {
									l_c = string_ord_at(l_ident, l_n + 1);
									if (l_c >= 48 && l_c <= 57) {
										l_i = ((l_i << 4) | l_c - 48);
									} else if (l_c >= 97 && l_c <= 102) {
										l_i = ((l_i << 4) | l_c - 87);
									} else if (l_c >= 65 && l_c <= 70) {
										l_i = ((l_i << 4) | l_c - 55);
									} else {
										l_z = true;
										break;
									}
								}
								if (!l_z) {
									l_i = (((l_i & 65280) | ((l_i & 16711680) >> 16)) | ((l_i & 255) << 16));
									l__out_tk = gml_token_number(l_d, l_i, undefined);
									if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
								}
							}
							if (l_z) {
								l__out_tk = gml_token_hash(l_d);
								if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
								l_pos = l_start;
							}
					}
					break;
				case 36:
					l_i = 0;
					while (l_pos < l_len) {
						l_c = buffer_peek(l_buf, l_pos, buffer_u8);
						if (l_c != 95) {
							if (l_c >= 48 && l_c <= 57) {
								l_i = ((l_i << 4) | l_c - 48);
							} else if (l_c >= 97 && l_c <= 102) {
								l_i = ((l_i << 4) | l_c - 87);
							} else if (l_c >= 65 && l_c <= 70) {
								l_i = ((l_i << 4) | l_c - 55);
							} else break;
						}
						l_pos++;
					}
					if (l_pos > l_start + 1) {
						l__out_tk = gml_token_number(l_d, l_i, gml_parser_buf_sub(l_buf, l_sub_buf, l_start, l_pos));
						if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
					} else {
						l__out_tk = gml_token_dollar_sign(l_d);
						if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
					}
					break;
				default:
					if (l_c >= 97 && l_c <= 122 || l_c >= 65 && l_c <= 90 || l_c == 95) {
						while (l_pos < l_len) {
							l_c = buffer_peek(l_buf, l_pos, buffer_u8);
							if (l_c == 95 || l_c >= 97 && l_c <= 122 || l_c >= 65 && l_c <= 90 || l_c >= 48 && l_c <= 57) l_pos++; else break;
						}
						l_s = gml_parser_buf_sub(l_buf, l_sub_buf, l_start, l_pos);
						var l_fn = data_gml_keyword_mapper_map.h_obj[$ l_s];
						if (l_fn != undefined) {
							var l_tk = l_fn(l_d);
							if (l_tk != undefined) {
								l__out_tk = l_tk;
								if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
							} else {
								l__out_tk = gml_token_ident(l_d, l_s);
								if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
							}
						} else if (gml_std_StringTools_startsWith(l_s, "argument")) {
							var l_s_8 = gml_std_string_substring(l_s, 8);
							if (string_digits(l_s_8) == l_s_8) {
								l__out_tk = gml_token_arg_const(l_d, gml_std_Std_parseInt(l_s_8));
								if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
							} else {
								l__out_tk = gml_token_ident(l_d, l_s);
								if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
							}
						} else {
							l__out_tk = gml_token_ident(l_d, l_s);
							if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
						}
					} else if (l_c >= 48 && l_c <= 57 || l_c == 46) {
						if (l_c == 48) {
							l_i = buffer_peek(l_buf, l_pos, buffer_u8);
							if (l_i == 120) {
								l_pos++;
								l_i = 0;
								while (l_pos < l_len) {
									l_c = buffer_peek(l_buf, l_pos, buffer_u8);
									if (l_c != 95) {
										if (l_c >= 48 && l_c <= 57) {
											l_i = ((l_i << 4) | l_c - 48);
										} else if (l_c >= 97 && l_c <= 102) {
											l_i = ((l_i << 4) | l_c - 87);
										} else if (l_c >= 65 && l_c <= 70) {
											l_i = ((l_i << 4) | l_c - 55);
										} else break;
									}
									l_pos++;
								}
								l__out_tk = gml_token_number(l_d, l_i, gml_parser_buf_sub(l_buf, l_sub_buf, l_start, l_pos));
								if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
								continue;
							}
							if (l_i == 98) {
								l_pos++;
								l_i = 0;
								while (l_pos < l_len) {
									l_c = buffer_peek(l_buf, l_pos, buffer_u8);
									if (l_c != 95) {
										if (l_c >= 48 && l_c <= 49) l_i = ((l_i << 1) | l_c - 48); else break;
									}
									l_pos++;
								}
								l__out_tk = gml_token_number(l_d, l_i, gml_parser_buf_sub(l_buf, l_sub_buf, l_start, l_pos));
								if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
								continue;
							}
						}
						l_pos--;
						l_z = false;
						l_s = undefined;
						while (l_pos < l_len) {
							l_c = buffer_peek(l_buf, l_pos, buffer_u8);
							if (l_c == 46) {
								if (l_z) {
									ds_list_destroy(l_out);
									return gml_parser_error("Extra dot in a number", l_d, l_out);
								} else {
									l_pos++;
									l_c = buffer_peek(l_buf, l_pos, buffer_u8);
									if (l_c == 95 || l_c >= 97 && l_c <= 122 || l_c >= 65 && l_c <= 90) {
										l_s = gml_parser_buf_sub(l_buf, l_sub_buf, l_start, l_pos - 1);
										l__out_tk = gml_token_number(l_d, gml_std_Std_parseFloat(l_s), l_s);
										if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
										l_d = new gml_pos(l_src, l_row, l_pos - l_rowStart);
										l__out_tk = gml_token_period(l_d);
										if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
										break;
									}
									l_z = true;
								}
							} else if (l_c >= 48 && l_c <= 57 || l_c == 95) {
								l_pos++;
							} else break;
						}
						if (l_s == undefined) {
							while (buffer_peek(l_buf, l_start, buffer_u8) == 48) {
								l_start++;
								if (l_start >= l_pos) {
									l_start--;
									break;
								} else if (buffer_peek(l_buf, l_start, buffer_u8) == 46) {
									l_start--;
									break;
								}
							}
							l_s = gml_parser_buf_sub(l_buf, l_sub_buf, l_start, l_pos);
							l_s = string_replace_all(l_s, "_", "");
							var l_f = gml_std_Std_parseFloat(l_s);
							if (!l_z) {
								if (string_format(l_f, 0, 0) != l_s) {
									var l_i64 = int64(l_s);
									if (string(l_i64) == l_s) l_f = l_i64;
								}
							}
							l__out_tk = gml_token_number(l_d, l_f, l_s);
							if (l__gthis.h_curr_macro != undefined) array_push(l__gthis.h_curr_macro.h_tokens, l__out_tk); else ds_list_add(l_out, l__out_tk);
						}
					} else {
						var l_text = "Unexpected character `" + chr(l_c) + "`";
						ds_list_destroy(l_out);
						return gml_parser_error(l_text, l_d, l_out);
					}
			}
		}
		if (l_temStart >= 0) {
			gml_parser_tem_end = l_pos;
			gml_parser_tem_row = l_row;
			gml_parser_tem_row_start = l_rowStart;
		} else {
			l__gthis.h_curr_macro = undefined;
			if (l_src.h___eof == undefined) l_src.h___eof = new gml_pos(l_src, l_row, l_pos - l_rowStart);
		}
		l_n = ds_list_size(l_out);
		l_tks = array_create(l_n);
		for (l_i = 0; l_i < l_n; l_i++) {
			l_tks[@l_i] = ds_list_find_value(l_out, l_i);
			l_tks[l_i].__enumName__ = gml_std_Type_enumConstructor(l_tks[l_i]);
		}
		l__gthis.h_tokens = l_tks;
		l__gthis.h_token_count = ds_list_size(l_out);
		ds_list_destroy(l_out);
		return l_tks;
	}
	self.h_curr_macro = undefined;
	self.h_macros = [];
	self.h_token_count = -1;
	self.h_tokens = undefined;
	self.h_source = l_src;
	static __class__ = mt_gml_parser;
}

if (live_enabled) 
function gml_parser_set_version(l_ver) {
	if (l_ver < 10) {
		show_error("Supported versions are 14,20,23", true);
	} else if (l_ver < 20) {
		gml_parser_default_version = api_api_version_v1;
	} else if (l_ver < 23) {
		gml_parser_default_version = api_api_version_v2;
	} else gml_parser_default_version = api_api_version_v23;
}

if (live_enabled) 
function gml_parser_error(l_text, l_pos, l_tkl) {
	l_tkl.destroy();
	gml_parser_error_text = l_pos.h_to_string() + ": " + l_text;
	gml_parser_error_pos = l_pos;
	return undefined;
}

if (live_enabled) 
function gml_parser_buf_sub(l_buf, l_str, l_start, l_end) {
	var l_len = l_end - l_start;
	buffer_copy(l_buf, l_start, l_len, l_str, 0);
	buffer_poke(l_str, l_len, buffer_u8, 0);
	buffer_seek(l_str, buffer_seek_start, 0);
	return buffer_read(l_str, buffer_string);
}

#endregion
