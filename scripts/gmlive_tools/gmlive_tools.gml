// GMLive.gml (c) YellowAfterlife, 2017+
// PLEASE DO NOT FORGET to remove paid extensions from your project when publishing the source code!
// And if you are using git, you can exclude GMLive by adding
// `scripts/GMLive*` and `extensions/GMLive/` lines to your `.gitignore`.
// Feather disable all

// Most of the functions that you are actually supposed to touch are here
#region live

function sprite_set_live(l_spr, l_live1) {
	if (live_enabled) {
		var l_i;
		if (l_live1) {
			if (ds_map_exists(live_live_sprites, l_spr)) exit;
			ds_map_set(live_live_sprites, l_spr, true);
			l_i = ds_list_find_index(live_live_sprites_stop, l_spr);
			if (l_i >= 0) ds_list_delete(live_live_sprites_stop, l_i);
			ds_list_add(live_live_sprites_start, l_spr);
		} else {
			if (!ds_map_exists(live_live_sprites, l_spr)) exit;
			ds_map_delete(live_live_sprites, l_spr);
			l_i = ds_list_find_index(live_live_sprites_start, l_spr);
			if (l_i >= 0) ds_list_delete(live_live_sprites_start, l_i);
			ds_list_add(live_live_sprites_stop, l_spr);
		}
	}
}

function path_set_live(l_pt, l_live1) {
	if (live_enabled) {
		var l_i;
		if (l_live1) {
			if (ds_map_exists(live_live_point_paths, l_pt)) exit;
			ds_map_set(live_live_point_paths, l_pt, true);
			l_i = ds_list_find_index(live_live_point_paths_stop, l_pt);
			if (l_i >= 0) ds_list_delete(live_live_point_paths_stop, l_i);
			ds_list_add(live_live_point_paths_start, l_pt);
		} else {
			if (!ds_map_exists(live_live_point_paths, l_pt)) exit;
			ds_map_delete(live_live_point_paths, l_pt);
			l_i = ds_list_find_index(live_live_point_paths_start, l_pt);
			if (l_i >= 0) ds_list_delete(live_live_point_paths_start, l_i);
			ds_list_add(live_live_point_paths_stop, l_pt);
		}
	}
}

function file_set_live(l_path1, l_callback, l_kind) {
	if (false) show_debug_message(argument[2]);
	if (live_enabled) {
		var l_i;
		if (l_callback != undefined) {
			if (ds_map_exists(live_live_included_files, l_path1)) exit;
			var l_k;
			if (l_kind == undefined) {
				switch (string_lower(filename_ext(l_path1))) {
					case ".csv": l_k = 4; break;
					case ".json": l_k = 2; break;
					case ".txt": l_k = 1; break;
					case ".bin": l_k = 0; break;
					case ".b64": case ".base64": l_k = 3; break;
					default:
						show_error("Cannot auto-detect kind for \"" + l_path1 + "\"", false);
						exit;
				}
			} else switch (l_kind) {
				case "text": l_k = 1; break;
				case "json": l_k = 2; break;
				case "csv": l_k = 4; break;
				case "base64": l_k = 3; break;
				case "buffer": l_k = 0; break;
				case "auto":
					switch (string_lower(filename_ext(l_path1))) {
						case ".csv": l_k = 4; break;
						case ".json": l_k = 2; break;
						case ".txt": l_k = 1; break;
						case ".bin": l_k = 0; break;
						case ".b64": case ".base64": l_k = 3; break;
						default:
							show_error("Cannot auto-detect kind for \"" + l_path1 + "\"", false);
							exit;
					}
					break;
				default:
					show_error("Unrecognized kind \"" + gml_std_Std_stringify(l_kind) + "\"", false);
					exit;
			}
			ds_map_set(live_live_included_files, l_path1, { func: l_callback, kind: l_k });
			l_i = ds_list_find_index(live_live_included_files_stop, l_path1);
			if (l_i >= 0) ds_list_delete(live_live_included_files_stop, l_i);
			ds_list_add(live_live_included_files_start, l_path1);
		} else {
			if (!ds_map_exists(live_live_included_files, l_path1)) exit;
			if (l_kind != undefined) {
				show_error("Kind should not be specified without a callback", false);
				exit;
			}
			ds_map_delete(live_live_included_files, l_path1);
			l_i = ds_list_find_index(live_live_included_files_start, l_path1);
			if (l_i >= 0) ds_list_delete(live_live_included_files_start, l_i);
			ds_list_add(live_live_included_files_stop, l_path1);
		}
	}
}

function room_set_live(l_rm, l_enable) {
	if (live_enabled) {
		var l_i;
		if (l_enable) {
			if (ds_map_exists(live_live_rooms, l_rm)) exit;
			ds_map_set(live_live_rooms, l_rm, true);
			l_i = ds_list_find_index(live_live_rooms_stop, l_rm);
			if (l_i >= 0) ds_list_delete(live_live_rooms_stop, l_i);
			ds_list_add(live_live_rooms_start, l_rm);
		} else {
			if (!ds_map_exists(live_live_rooms, l_rm)) exit;
			ds_map_delete(live_live_rooms, l_rm);
			ds_map_delete(live_live_room_data, l_rm);
			l_i = ds_list_find_index(live_live_rooms_start, l_rm);
			if (l_i >= 0) ds_list_delete(live_live_rooms_start, l_i);
			ds_list_add(live_live_rooms_stop, l_rm);
		}
	}
}

function room_goto_live(l_rm) {
	if (live_enabled) {
		if (ds_map_exists(live_live_rooms, l_rm) && ds_map_exists(live_live_room_data, l_rm)) {
			live_live_room = l_rm;
			if (!room_exists(live_blank_room)) show_error("Please add a completely empty room, add live_room_start(); to it's Creation Code, and assign it to live_blank_room in obj_gmlive's create event.", true);
			room_goto(live_blank_room);
			exit;
		}
		room_goto(l_rm);
	}
}

if (live_enabled) 
function live_room_updated_impl(l_rm) {
	room_goto_live(l_rm);
}

#endregion

#region live

if (live_enabled) 
function live_temp_path_init() {
	return "gmlive-" + gml_std_Std_stringify(gml_std_Date_now().h_getTime());
}

if (live_enabled) 
function live_script_get_index(l_name) {
	return asset_get_index(l_name);
}

if (live_enabled) 
function live_log_impl(l_text, l_level) {
	show_debug_message(l_text);
}

if (live_enabled) 
function live_log(l_s, l_level) {
	live_log_script(("[live][" + date_datetime_string(gml_std_Date_now().h_date) + "] " + l_s), l_level);
}

function live_update_script_impl(l_name, l_ident, l_code) {
	if (live_enabled) {
		var l_data = live_live_map.h_obj[$ l_ident];
		if (l_data == undefined) {
			l_data = live_cache_data_create();
			live_live_map.h_obj[$ l_ident] = l_data;
		}
		var l_pg = live_gmlive_patcher_compile_ex(l_name, l_code);
		if (l_pg == undefined) {
			live_log("Error in " + l_name + ":", 2);
			live_log(live_gmlive_patcher_error_text, 2);
			exit;
		}
		if (l_pg.h_error_text != undefined) {
			live_log("Warning in " + l_name + ":", 2);
			live_log(l_pg.h_error_text, 2);
		}
		l_pg.h_live_ident = l_ident;
		live_log("Reloaded " + l_name + ".", 0);
		if (l_data[0/* program */] != undefined) l_data[0/* program */].h_destroy();
		l_data[@0/* program */] = l_pg;
	}
}

function live_constant_add(l_name, l_value) {
	if (live_enabled) {
		gml_const_add(l_name, l_value);
	}
}

function live_constant_delete(l_name) {
	if (live_enabled) {
		return gml_remove_const(l_name);
	} else return false;
}

function live_variable_add(l_signature, l_func) {
	if (live_enabled) {
		gml_var_add(l_signature, l_func);
	}
}

function live_variable_delete(l_name) {
	if (live_enabled) {
		return gml_remove_var(l_name);
	} else return false;
}

function live_function_add(l_signature, l_func) {
	if (live_enabled) {
		var l_f = new gml_func();
		l_f.h_set(l_signature, l_func);
		gml_func_map.h_obj[$ l_f.h_name] = l_f;
	}
}

function live_function_delete(l_name) {
	if (live_enabled) {
		return gml_remove_func(l_name);
	} else return false;
}

function live_throw_error(l_text) {
	if (live_enabled) {
		gml_thread_error(l_text);
	}
}

function live_execute_string(l_gml_code) {
	if (false) show_debug_message(argument[argument_count - 1]);
	if (live_enabled) {
		var l_pg = new gml_program([new gml_source("execute_string", l_gml_code, "execute_string")]);
		var l_ok;
		live_custom_self = self;
		live_custom_other = other;
		if (l_pg.h_error_text == undefined) {
			var l_argc = (argument_count - 1);
			var l_argv = array_create(l_argc);
			var l_i = 0;
			var l__ = 0;
			for (var l__g1 = l_argc; l__ < l__g1; l__++) {
				l_argv[@l_i] = argument[l_i + 1];
				l_i++;
			}
			var l_th = l_pg.h_call_v("execute_string", l_argv, false);
			if (l_th.h_status == 3) {
				l_ok = true;
				live_result = l_th.h_result;
			} else {
				l_ok = false;
				live_result = l_th.h_error_text;
				if (live_result == undefined) live_result = "(unknown error)";
			}
		} else {
			l_ok = false;
			live_result = l_pg.h_error_text;
		}
		l_pg.h_destroy();
		return l_ok;
	} else return false;
}

function live_snippet_create(l_gml_code, l_name) {
	if (l_name == undefined) l_name = "snippet";
	if (false) show_debug_message(argument[1]);
	if (live_enabled) {
		var l_pg = new gml_program([new gml_source(l_name, l_gml_code, "snippet")]);
		if (l_pg.h_error_text == undefined) {
			return l_pg;
		} else {
			live_result = l_pg.h_error_text;
			l_pg.h_destroy();
			return undefined;
		}
	} else return undefined;
}

function live_snippet_destroy(l_snippet) {
	if (live_enabled) {
		if (l_snippet.h_script_array != undefined) l_snippet.h_destroy(); else show_error("This snippet is already destroyed", true);
	}
}

function live_snippet_call(l_snippet) {
	if (false) show_debug_message(argument[argument_count - 1]);
	if (live_enabled) {
		var l_argc = (argument_count - 1);
		var l_argv = array_create(l_argc);
		var l_i = 0;
		var l__ = 0;
		for (var l__g1 = l_argc; l__ < l__g1; l__++) {
			l_argv[@l_i] = argument[l_i + 1];
			l_i++;
		}
		live_custom_self = self;
		live_custom_other = other;
		var l_th = l_snippet.h_call_v("snippet", l_argv, false);
		if (l_th == undefined) {
			live_result = "(script missing)";
			return false;
		} else if (l_th.h_status == 3) {
			live_result = l_th.h_result;
			return true;
		} else {
			live_result = l_th.h_error_text;
			if (live_result == undefined) live_result = "(unknown error)";
			return false;
		}
	} else return false;
}

function live_update() {
	if (live_enabled) {
		if (live_request_url == undefined) exit;
		if (live_request_id == undefined) {
			var l_now = current_time / 1000 * 1000.;
			live_last_update_at = l_now;
			if (l_now > live_request_time) {
				live_request_time = l_now + live_request_rate * 1000;
				var l_url;
				if (live_request_guid == undefined) {
					l_url = live_request_url + "/init?password=" + live_request_password + "&version=" + string(106) + "&config=" + live_config + "&runtime=" + live_runtime_version + "&buildDate=" + gml_std_Std_stringify(live_build_date);
				} else {
					l_url = live_request_url + "/update?guid=" + ((live_request_guid == undefined ? "null" : live_request_guid));
					var l_sl = live_live_sprites_stop;
					var l_sln = ds_list_size(l_sl);
					if (l_sln > 0) {
						l_url += "&sprites" + string(0) + "=" + sprite_get_name(ds_list_find_value(l_sl, 0));
						var l_i = 1;
						for (var l__g1 = l_sln; l_i < l__g1; l_i++) {
							l_url += "+" + sprite_get_name(ds_list_find_value(l_sl, l_i));
						}
						ds_list_clear(l_sl);
					}
					var l_sl = live_live_sprites_start;
					var l_sln = ds_list_size(l_sl);
					if (l_sln > 0) {
						l_url += "&sprites" + string(1) + "=" + sprite_get_name(ds_list_find_value(l_sl, 0));
						var l_i = 1;
						for (var l__g1 = l_sln; l_i < l__g1; l_i++) {
							l_url += "+" + sprite_get_name(ds_list_find_value(l_sl, l_i));
						}
						ds_list_clear(l_sl);
					}
					var l_sl = live_shader_live_shaders_stop;
					var l_sln = ds_list_size(l_sl);
					if (l_sln > 0) {
						l_url += "&shaders" + string(0) + "=" + shader_get_name(ds_list_find_value(l_sl, 0));
						var l_i = 1;
						for (var l__g1 = l_sln; l_i < l__g1; l_i++) {
							l_url += "+" + shader_get_name(ds_list_find_value(l_sl, l_i));
						}
						ds_list_clear(l_sl);
					}
					var l_sl = live_shader_live_shaders_start;
					var l_sln = ds_list_size(l_sl);
					if (l_sln > 0) {
						l_url += "&shaders" + string(1) + "=" + shader_get_name(ds_list_find_value(l_sl, 0));
						var l_i = 1;
						for (var l__g1 = l_sln; l_i < l__g1; l_i++) {
							l_url += "+" + shader_get_name(ds_list_find_value(l_sl, l_i));
						}
						ds_list_clear(l_sl);
					}
					var l_rl = live_live_rooms_stop;
					var l_rln = ds_list_size(l_rl);
					if (l_rln > 0) {
						l_url += "&rooms" + string(0) + "=" + room_get_name(ds_list_find_value(l_rl, 0));
						var l_i = 1;
						for (var l__g1 = l_rln; l_i < l__g1; l_i++) {
							l_url += "+" + room_get_name(ds_list_find_value(l_rl, l_i));
						}
						ds_list_clear(l_rl);
					}
					var l_rl = live_live_rooms_start;
					var l_rln = ds_list_size(l_rl);
					if (l_rln > 0) {
						l_url += "&rooms" + string(1) + "=" + room_get_name(ds_list_find_value(l_rl, 0));
						var l_i = 1;
						for (var l__g1 = l_rln; l_i < l__g1; l_i++) {
							l_url += "+" + room_get_name(ds_list_find_value(l_rl, l_i));
						}
						ds_list_clear(l_rl);
					}
					var l_rl = live_live_point_paths_stop;
					var l_rln = ds_list_size(l_rl);
					if (l_rln > 0) {
						l_url += "&paths" + string(0) + "=" + path_get_name(ds_list_find_value(l_rl, 0));
						var l_i = 1;
						for (var l__g1 = l_rln; l_i < l__g1; l_i++) {
							l_url += "+" + path_get_name(ds_list_find_value(l_rl, l_i));
						}
						ds_list_clear(l_rl);
					}
					var l_rl = live_live_point_paths_start;
					var l_rln = ds_list_size(l_rl);
					if (l_rln > 0) {
						l_url += "&paths" + string(1) + "=" + path_get_name(ds_list_find_value(l_rl, 0));
						var l_i = 1;
						for (var l__g1 = l_rln; l_i < l__g1; l_i++) {
							l_url += "+" + path_get_name(ds_list_find_value(l_rl, l_i));
						}
						ds_list_clear(l_rl);
					}
					var l_rl = live_live_included_files_stop;
					var l_rln = ds_list_size(l_rl);
					if (l_rln > 0) {
						l_url += "&incFiles" + string(0) + "=" + ds_list_find_value(l_rl, 0);
						var l_i = 1;
						for (var l__g1 = l_rln; l_i < l__g1; l_i++) {
							l_url += "+" + ds_list_find_value(l_rl, l_i);
						}
						ds_list_clear(l_rl);
					}
					var l_rl = live_live_included_files_start;
					var l_rln = ds_list_size(l_rl);
					if (l_rln > 0) {
						l_url += "&incFiles" + string(1) + "=" + ds_list_find_value(l_rl, 0);
						var l_i = 1;
						for (var l__g1 = l_rln; l_i < l__g1; l_i++) {
							l_url += "+" + ds_list_find_value(l_rl, l_i);
						}
						ds_list_clear(l_rl);
					}
				}
				live_request_id = http_get(l_url);
			}
		}
	}
}

function live_init(l_updateRate, l_url, l_password) {
	if (live_enabled) {
		if (l_url != undefined) {
			var l_url_last = string_length(l_url) - 1;
			if (string_ord_at(l_url, l_url_last + 1) == 47) l_url = gml_std_string_substring(l_url, 0, l_url_last);
		}
		live_log("Initializing...", 0);
		live_config = os_get_config();
		live_runtime_version = GM_runtime_version;
		var l_date1 = gml_std_Date_now();
		l_date1.h_date = GM_build_date;
		live_build_date = l_date1.h_getTime();
		live_request_rate = l_updateRate;
		live_request_url = l_url;
		live_request_password = l_password;
		var l_srs = asset_get_index("shader_replace_simple");
		if (l_srs != -1) live_shader_updated = l_srs;
		live_log("Indexing assets...", 0);
		live_bits_gmlive_indexer_add_assets();
		if (l_url == undefined) live_bits_gmlive_indexer_add_scripts();
		live_log("Indexed OK!", 0);
	}
}

if (live_enabled) 
function live_preinit_project_fake_call() {
	live_name = undefined;
	return false;
}

if (live_enabled) 
function live_preinit_project_lf(l_write, l_val) {
	if (l_write) {
		live_name = l_val;
		return l_val;
	} else return live_name;
}

if (live_enabled) 
function live_preinit_project() {
	gml_var_add("live_name", live_preinit_project_lf);
	gml_const_add("live_result", false);
	gml_func_add("live_call(...):", live_preinit_project_fake_call);
	gml_func_add("live_defcall(...):", live_preinit_project_fake_call);
	gml_func_add("live_call_ext(...):", live_preinit_project_fake_call);
	gml_func_add("live_defcall_ext(...):", live_preinit_project_fake_call);
	gml_func_add("live_method(self, func):", live_method);
	gml_func_add("method(self, func):", live_method);
	gml_func_add("live_method_get_self(func):", live_method_get_self);
	gml_func_add("method_get_self(func):", live_method_get_self);
	gml_func_add("live_execute_string(:string):", live_execute_string);
	gml_func_add("live_snippet_create(:string, :string=\"snippet\"):", live_snippet_create);
	gml_func_add("live_snippet_call(snip, ...rest):", live_snippet_call);
	gml_func_add("live_snippet_destroy(snip):", live_snippet_destroy);
	gml_func_add("sprite_set_live(spr:index, status:bool)", sprite_set_live);
	gml_func_add("shader_set_live(sh:index, status:bool)", shader_set_live);
	gml_func_add("path_set_live(pt:index, status:bool)", path_set_live);
	gml_func_add("room_set_live(rm:index, status:bool)", room_set_live);
	gml_func_add("room_goto_live(rm:index)", room_goto_live);
}

#endregion
