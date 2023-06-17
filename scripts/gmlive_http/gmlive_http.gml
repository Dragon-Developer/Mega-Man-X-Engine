// GMLive.gml (c) YellowAfterlife, 2017+
// PLEASE DO NOT FORGET to remove paid extensions from your project when publishing the source code!
// And if you are using git, you can exclude GMLive by adding
// `scripts/GMLive*` and `extensions/GMLive/` lines to your `.gitignore`.
// Feather disable all

#region live.http

if (live_enabled) 
function live_async_http_0(l_map) {
	var l_i, l_n, l_s, l_list, l_names, l_srcMap;
	live_is_ready = true;
	live_request_guid = ds_map_find_value(l_map, "guid");
	if (ds_map_find_value(l_map, "version") == undefined || ds_map_find_value(l_map, "version") < 106) show_error("Outdated GMLive server detected! Please update the included files from the extension.", true);
	l_list = ds_map_find_value(l_map, "shaders");
	l_n = ds_list_size(l_list);
	for (l_i = 0; l_i < l_n; l_i++) {
		l_s = ds_list_find_value(l_list, l_i);
		gml_asset_add(l_s, asset_get_index(l_s));
	}
	for (var l__ = 0; l__ < 1; l__++) {
		l_list = ds_map_find_value(l_map, "animCurves");
		if (l_list == undefined) {
			live_log("Server init response is missing an animCurves list. You may need to update the server.", 1);
			continue;
		}
		l_n = ds_list_size(l_list);
		for (l_i = 0; l_i < l_n; l_i++) {
			l_s = ds_list_find_value(l_list, l_i);
			gml_asset_add(l_s, asset_get_index(l_s));
		}
	}
	l_list = ds_map_find_value(l_map, "scripts");
	l_n = ds_list_size(l_list);
	for (l_i = 0; l_i < l_n; l_i += 2) {
		var l_scrName = ds_list_find_value(l_list, l_i);
		var l_scrFunc = asset_get_index(l_scrName);
		if (l_scrFunc == -1) l_scrFunc = asset_get_index(l_scrName);
		gml_func_add(ds_list_find_value(l_list, l_i + 1), l_scrFunc);
		gml_func_script_id.h_obj[$ l_scrName] = l_scrFunc;
	}
	l_list = ds_map_find_value(l_map, "globals");
	l_n = ds_list_size(l_list);
	if (l_n > 0) {
		var l_buf = buffer_create(1024, buffer_grow, 1);
		buffer_seek(l_buf, buffer_seek_start, 0);
		buffer_write(l_buf, buffer_text, "globalvar ");
		buffer_write(l_buf, buffer_text, ds_list_find_value(l_list, 0));
		for (l_i = 1; l_i < l_n; l_i++) {
			buffer_write(l_buf, buffer_text, ", ");
			buffer_write(l_buf, buffer_text, ds_list_find_value(l_list, l_i));
		}
		buffer_write(l_buf, buffer_string, ";");
		buffer_seek(l_buf, buffer_seek_start, 0);
		live_live_globals = new gml_source("globalvar", buffer_read(l_buf, buffer_string), "globalvar", true);
		buffer_delete(l_buf);
	} else live_live_globals = undefined;
	l_srcMap = live_live_macros;
	l_srcMap.h_clear();
	l_list = ds_map_find_value(l_map, "macros");
	l_n = ds_list_size(l_list);
	for (l_i = 0; l_i < l_n; l_i += 2) {
		l_s = ds_list_find_value(l_list, l_i);
		var l_s1 = "macro:" + l_s;
		l_srcMap.h_obj[$ l_s] = new gml_source(l_s1, "#macro " + l_s + " " + gml_std_Std_stringify(ds_list_find_value(l_list, l_i + 1)), l_s1, true);
	}
	l_srcMap = live_live_enums;
	l_srcMap.h_clear();
	l_list = ds_map_find_value(l_map, "enums");
	l_names = ds_map_find_value(l_map, "enumnames");
	l_n = ds_list_size(l_list);
	for (l_i = 0; l_i < l_n; l_i++) {
		l_s = ds_list_find_value(l_list, l_i);
		l_s = ds_list_find_value(l_names, l_i);
		l_srcMap.h_obj[$ l_s] = new gml_source("enum " + l_s, ds_list_find_value(l_list, l_i), "enum " + l_s, true);
	}
	live_log("Ready!", 0);
}

if (live_enabled) 
function live_async_http_1(l_map) {
	var l_list = ds_map_find_value(l_map, "files");
	var l_n = ds_list_size(l_list);
	var l_name;
	var l_i = -1;
	while (++l_i < l_n) {
		var l_fmap = ds_list_find_value(l_list, l_i);
		var l_ident = ds_map_find_value(l_fmap, "ident");
		var l_code = ds_map_find_value(l_fmap, "code");
		l_name = ds_map_find_value(l_fmap, "name");
		live_update_script(l_name, l_ident, l_code);
	}
	l_list = ds_map_find_value(l_map, "sprites");
	if (l_list != undefined) {
		l_n = ds_list_size(l_list);
		l_i = -1;
		while (++l_i < l_n) {
			var l_sup = ds_list_find_value(l_list, l_i);
			l_name = ds_map_find_value(l_sup, "name");
			var l_spr = asset_get_index(l_name);
			if (l_spr == -1) {
				live_log("Error: can't find sprite " + l_name + " for reload.", 2);
				continue;
			}
			var l_sx = ds_map_find_value(l_sup, "xorig");
			var l_sy = ds_map_find_value(l_sup, "yorig");
			var l_frames = ds_map_find_value(l_sup, "frames");
			var l_out = -1;
			var l_tmp = live_temp_path + ".png";
			var l_i1 = 0;
			for (var l__g1 = ds_list_size(l_frames); l_i1 < l__g1; l_i1++) {
				var l_tb = buffer_base64_decode(ds_list_find_value(l_frames, l_i1));
				if (l_tb == -1) {
					live_log("Error: couldn't decode base64 for " + l_name + ".", 2);
					continue;
				}
				buffer_save(l_tb, l_tmp);
				buffer_delete(l_tb);
				var l_ts = sprite_add(l_tmp, 1, false, false, l_sx, l_sy);
				if (l_ts == -1) {
					live_log("Error: couldn't load image " + string(l_i1) + " for " + l_name + ".", 2);
					continue;
				}
				if (l_i1 != 0) sprite_merge(l_out, l_ts); else l_out = l_ts;
			}
			if (l_out != -1) {
				sprite_assign(l_spr, l_out);
				sprite_collision_mask(l_spr, ds_map_find_value(l_sup, "sepMasks"), ds_map_find_value(l_sup, "bboxMode"), ds_map_find_value(l_sup, "bboxLeft"), ds_map_find_value(l_sup, "bboxTop"), ds_map_find_value(l_sup, "bboxRight"), ds_map_find_value(l_sup, "bboxBottom"), ds_map_find_value(l_sup, "colKind"), ds_map_find_value(l_sup, "colTolerance"));
				sprite_delete(l_out);
				live_log("Reloaded " + l_name + ".", 0);
			}
			file_delete(l_tmp);
		}
	}
	l_list = ds_map_find_value(l_map, "shadersUpd");
	if (l_list != undefined) {
		l_n = ds_list_size(l_list);
		l_i = -1;
		while (++l_i < l_n) {
			var l_sup = ds_list_find_value(l_list, l_i);
			l_name = ds_map_find_value(l_sup, "name");
			live_shader_updated(asset_get_index(l_name), ds_map_find_value(l_sup, "vertex"), ds_map_find_value(l_sup, "fragment"));
			live_log("Reloaded " + l_name + ".", 0);
		}
	}
	l_list = ds_map_find_value(l_map, "rooms");
	if (l_list != undefined) {
		l_n = ds_list_size(l_list);
		l_i = -1;
		while (++l_i < l_n) {
			var l_ru = ds_list_find_value(l_list, l_i);
			var l_rq = asset_get_index(l_ru[?"name"]);
			ds_map_set(live_live_room_data, l_rq, l_ru[?"json"]);
			live_room_updated(l_rq);
		}
	}
	l_list = ds_map_find_value(l_map, "pathsUpd");
	if (l_list != undefined) {
		var l_i = 0;
		for (var l__g1 = ds_list_size(l_list); l_i < l__g1; l_i++) {
			var l_pup = ds_list_find_value(l_list, l_i);
			l_name = ds_map_find_value(l_pup, "name");
			var l_pt = asset_get_index(l_name);
			if (!path_exists(l_pt)) {
				live_log("Couldn't find path '" + l_name + "'", 1);
				continue;
			}
			path_clear_points(l_pt);
			path_set_closed(l_pt, ds_map_find_value(l_pup, "closed"));
			path_set_kind(l_pt, ds_map_find_value(l_pup, "kind"));
			path_set_precision(l_pt, ds_map_find_value(l_pup, "precision"));
			var l__g_list = ds_map_find_value(l_pup, "points");
			var l__g_index = 0;
			while (l__g_index < ds_list_size(l__g_list)) {
				var l_point = ds_list_find_value(l__g_list, l__g_index++);
				path_add_point(l_pt, ds_map_find_value(l_point, "x"), ds_map_find_value(l_point, "y"), ds_map_find_value(l_point, "speed"));
			}
		}
	}
	l_list = ds_map_find_value(l_map, "incFilesUpd");
	if (l_list != undefined) {
		var l_i = 0;
		for (var l__g1 = ds_list_size(l_list); l_i < l__g1; l_i++) {
			var l_sub = ds_list_find_value(l_list, l_i);
			l_name = ds_map_find_value(l_sub, "path");
			var l_ip = ds_map_find_value(live_live_included_files, l_name);
			if (l_ip == undefined) {
				live_log("Couldn't find live included file \"" + l_name + "\"", 1);
				continue;
			}
			var l_b64 = ds_map_find_value(l_sub, "data");
			switch (l_ip.kind) {
				case 1: l_ip.func(base64_decode(l_b64), l_name); break;
				case 4:
					var l_tmp1 = live_temp_path + ".csv";
					buffer_save(buffer_base64_decode(l_b64), l_tmp1);
					var l_grid = load_csv(l_tmp1);
					l_ip.func(l_grid, l_name);
					ds_grid_destroy(l_grid);
					file_delete(l_tmp1);
					break;
				case 0:
					var l_buf = buffer_base64_decode(l_b64);
					l_ip.func(l_buf, l_name);
					buffer_delete(l_buf);
					break;
				case 2:
					var l_val;
					try {
						l_val = json_parse(base64_decode(l_b64))
					} catch (l__g2) {
						live_log("Couldn't decode JSON for \"" + l_name + "\": " + gml_std_Std_stringify(gml_std_haxe_Exception_caught(l__g2).h_unwrap()), 1);
						continue;
					}
					l_ip.func(l_val, l_name);
					break;
				case 3: l_ip.func(l_b64, l_name); break;
			}
		}
	}
}

if (live_enabled) 
function live_async_http_check(l_e) {
	return ds_map_find_value(l_e, "id") == live_request_id && ds_map_find_value(l_e, "status") <= 0;
}

function live_async_http(l_e) {
	if (false) show_debug_message(argument[0]);
	if (live_enabled) {
		if (l_e == undefined) l_e = async_load;
		if (!live_async_http_check(l_e)) exit;
		live_request_id = undefined;
		if (ds_map_find_value(l_e, "status") < 0 || ds_map_find_value(l_e, "result") == undefined) exit;
		var l_json1 = ds_map_find_value(l_e, "result");
		var l_map = json_decode(l_json1);
		if (l_map == -1 || ds_map_exists(l_map, "default")) {
			if (string_char_at(l_json1, 1) == "{" && string_char_at(l_json1, string_length(l_json1) - 1 + 1) == "]") l_json1 += "}";
			l_map = json_decode(l_json1);
			if (l_map == -1 || ds_map_exists(l_map, "default")) {
				live_log("Invalid JSON response (" + gml_std_Std_stringify(string_length(l_json1) / 1000) + " KB)", 2);
				exit;
			}
		}
		if (live_request_guid == undefined) live_async_http_0(l_map);
		live_async_http_1(l_map);
		ds_map_destroy(l_map);
	}
}

#endregion
