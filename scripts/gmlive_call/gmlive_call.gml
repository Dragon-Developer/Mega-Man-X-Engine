// GMLive.gml (c) YellowAfterlife, 2017+
// PLEASE DO NOT FORGET to remove paid extensions from your project when publishing the source code!
// And if you are using git, you can exclude GMLive by adding
// `scripts/GMLive*` and `extensions/GMLive/` lines to your `.gitignore`.
// Feather disable all

// live_call() and co.
#region live.call

if (live_enabled) 
function live_proc_call_origin(l_origin) {
	var l_data = undefined;
	var l_co = gml_std_string_pos_ext_haxe(l_origin, ":");
	if (l_co >= 0) {
		var l_oclip = gml_std_string_substr(l_origin, 0, l_co);
		l_data = live_live_map.h_obj[$ l_oclip];
		if (l_data == undefined && gml_std_string_substr(l_oclip, 0, 11) == "gml_Script_") {
			l_oclip = gml_std_string_substring(l_oclip, 11);
			l_data = live_live_map.h_obj[$ l_oclip];
		}
		if (l_data != undefined) live_live_map.h_obj[$ l_origin] = l_data;
	} else if (gml_std_string_substr(l_origin, 0, 11) == "gml_Script_") {
		l_data = live_live_map.h_obj[$ gml_std_string_substring(l_origin, 11)];
		if (l_data != undefined) live_live_map.h_obj[$ l_origin] = l_data;
	}
	return l_data;
}

if (live_enabled) 
function live_proc_call_impl(l_data, l_args1, l_def) {
	var l_pg = l_data[0/* program */];
	if (l_pg == undefined) return false;
	live_custom_self = self;
	live_custom_other = other;
	var l_scriptName = l_pg.h_tag;
	var l_th = l_pg.h_call_v(l_scriptName, l_args1, false);
	if (l_th == undefined) {
		live_result = l_def;
		live_log("`" + ((l_scriptName == undefined ? "null" : gml_std_Std_stringify(l_scriptName))) + "` is missing from the live program for some reason (?)", 2);
		return false;
	} else if (l_th.h_status == 3) {
		live_result = l_th.h_result;
		return true;
	} else if (l_th.h_status == 4) {
		live_result = l_def;
		live_log("Runtime error: " + l_th.h_get_error(), 2);
		return true;
	} else return false;
}

function live_call() {
	if (false) show_debug_message(argument[argument_count - 1]);
	if (live_enabled) {
		var l_def = undefined;
		var l_origin;
		if (live_request_guid == undefined) {
			live_name = undefined;
			l_origin = undefined;
		} else {
			var l_now = current_time / 1000 * 1000;
			if (l_now > live_last_update_at + 5000 && l_now > live_last_warn_at + 5000) {
				var l_stack = debug_get_callstack(2);
				live_last_warn_at = l_now;
				live_log("Calling live_call from " + l_stack[1] + ", but live_update was last called " + string(ceil((l_now - live_last_update_at) / 1000)) + " seconds ago. Did you deactivate/delete GMLive's object?", 1);
			}
			var l_origin1;
			if (live_name != undefined) {
				l_origin1 = live_name;
				live_name = undefined;
			} else {
				var l_stack = debug_get_callstack(2);
				l_origin1 = l_stack[1];
			}
			l_origin = l_origin1;
		}
		if (l_origin == undefined) {
			return false;
		} else {
			var l_data = live_live_map.h_obj[$ l_origin];
			if (l_data == undefined) l_data = live_proc_call_origin(l_origin);
			if (l_data == undefined) {
				return false;
			} else {
				var l_argc = argument_count;
				var l_vals = array_create(l_argc);
				while (--l_argc >= 0) {
					l_vals[@l_argc] = argument[l_argc];
				}
				return live_proc_call_impl(l_data, l_vals, l_def);
			}
		}
	} else return false;
}

function live_defcall() {
	if (false) show_debug_message(argument[argument_count - 1]);
	if (live_enabled) {
		var l_argc = argument_count - 1;
		var l_def = argument[l_argc];
		var l_origin;
		if (live_request_guid == undefined) {
			live_name = undefined;
			l_origin = undefined;
		} else {
			var l_now = current_time / 1000 * 1000;
			if (l_now > live_last_update_at + 5000 && l_now > live_last_warn_at + 5000) {
				var l_stack = debug_get_callstack(2);
				live_last_warn_at = l_now;
				live_log("Calling live_defcall from " + l_stack[1] + ", but live_update was last called " + string(ceil((l_now - live_last_update_at) / 1000)) + " seconds ago. Did you deactivate/delete GMLive's object?", 1);
			}
			var l_origin1;
			if (live_name != undefined) {
				l_origin1 = live_name;
				live_name = undefined;
			} else {
				var l_stack = debug_get_callstack(2);
				l_origin1 = l_stack[1];
			}
			l_origin = l_origin1;
		}
		if (l_origin == undefined) {
			return false;
		} else {
			var l_data = live_live_map.h_obj[$ l_origin];
			if (l_data == undefined) l_data = live_proc_call_origin(l_origin);
			if (l_data == undefined) {
				return false;
			} else {
				var l_vals = array_create(l_argc);
				while (--l_argc >= 0) {
					l_vals[@l_argc] = argument[l_argc];
				}
				return live_proc_call_impl(l_data, l_vals, l_def);
			}
		}
	} else return false;
}

function live_call_ext(l_args1) {
	if (live_enabled) {
		var l_origin;
		if (live_request_guid == undefined) {
			live_name = undefined;
			l_origin = undefined;
		} else {
			var l_now = current_time / 1000 * 1000;
			if (l_now > live_last_update_at + 5000 && l_now > live_last_warn_at + 5000) {
				var l_stack = debug_get_callstack(2);
				live_last_warn_at = l_now;
				live_log("Calling live_call_ext from " + l_stack[1] + ", but live_update was last called " + string(ceil((l_now - live_last_update_at) / 1000)) + " seconds ago. Did you deactivate/delete GMLive's object?", 1);
			}
			var l_origin1;
			if (live_name != undefined) {
				l_origin1 = live_name;
				live_name = undefined;
			} else {
				var l_stack = debug_get_callstack(2);
				l_origin1 = l_stack[1];
			}
			l_origin = l_origin1;
		}
		if (l_origin == undefined) {
			return false;
		} else {
			var l_data = live_live_map.h_obj[$ l_origin];
			if (l_data == undefined) l_data = live_proc_call_origin(l_origin);
			if (l_data == undefined) return false; else return live_proc_call_impl(l_data, gml_value_list_copy(l_args1), undefined);
		}
	} else return false;
}

function live_defcall_ext(l_args1, l_def) {
	if (live_enabled) {
		var l_origin;
		if (live_request_guid == undefined) {
			live_name = undefined;
			l_origin = undefined;
		} else {
			var l_now = current_time / 1000 * 1000;
			if (l_now > live_last_update_at + 5000 && l_now > live_last_warn_at + 5000) {
				var l_stack = debug_get_callstack(2);
				live_last_warn_at = l_now;
				live_log("Calling live_defcall_ext from " + l_stack[1] + ", but live_update was last called " + string(ceil((l_now - live_last_update_at) / 1000)) + " seconds ago. Did you deactivate/delete GMLive's object?", 1);
			}
			var l_origin1;
			if (live_name != undefined) {
				l_origin1 = live_name;
				live_name = undefined;
			} else {
				var l_stack = debug_get_callstack(2);
				l_origin1 = l_stack[1];
			}
			l_origin = l_origin1;
		}
		if (l_origin == undefined) {
			return false;
		} else {
			var l_data = live_live_map.h_obj[$ l_origin];
			if (l_data == undefined) l_data = live_proc_call_origin(l_origin);
			if (l_data == undefined) return false; else return live_proc_call_impl(l_data, gml_value_list_copy(l_args1), l_def);
		}
	} else return false;
}

if (live_enabled) 
function live_auto_call_1() {
	#macro live_auto_call if (live_auto_call_1()) { var lac_argc = argument_count, lac_args = array_create(lac_argc), lac_argk = 0; repeat (lac_argc) { lac_args[lac_argk] = argument[lac_argk]; lac_argk++; } if (live_auto_call_2(lac_args)) return live_result; };
	var l_origin;
	if (live_request_guid == undefined) {
		live_name = undefined;
		l_origin = undefined;
	} else {
		var l_now = current_time / 1000 * 1000;
		if (l_now > live_last_update_at + 5000 && l_now > live_last_warn_at + 5000) {
			var l_stack = debug_get_callstack(2);
			live_last_warn_at = l_now;
			live_log("Calling live_auto_call from " + l_stack[1] + ", but live_update was last called " + string(ceil((l_now - live_last_update_at) / 1000)) + " seconds ago. Did you deactivate/delete GMLive's object?", 1);
		}
		var l_origin1;
		if (live_name != undefined) {
			l_origin1 = live_name;
			live_name = undefined;
		} else {
			var l_stack = debug_get_callstack(2);
			l_origin1 = l_stack[1];
		}
		l_origin = l_origin1;
	}
	if (l_origin == undefined) return false;
	var l_data = live_live_map.h_obj[$ l_origin];
	if (l_data == undefined) l_data = live_proc_call_origin(l_origin);
	if (l_data == undefined) return false;
	live_auto_call_data = l_data;
	return true;
}

if (live_enabled) 
function live_auto_call_2(l_args1) {
	return live_proc_call_impl(live_auto_call_data, l_args1, undefined);
}

#endregion
