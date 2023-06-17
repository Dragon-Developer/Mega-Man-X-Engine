// GMLive.gml (c) YellowAfterlife, 2017+
// PLEASE DO NOT FORGET to remove paid extensions from your project when publishing the source code!
// And if you are using git, you can exclude GMLive by adding
// `scripts/GMLive*` and `extensions/GMLive/` lines to your `.gitignore`.
// Feather disable all

// More of a coroutine really
#region gml.thread

if (live_enabled) 
function gml_thread(l_program, l_actions, l_args1, l_locals, l_self1, l_other1, l_offset) constructor {
	static h_result = undefined; /// @is {any}
	static h_status = undefined; /// @is {gml_thread_status}
	static h_callback = undefined; /// @is {function<gml_thread; void>}
	static h_scope = undefined; /// @is {gml_thread_scope}
	static h_wait_time = undefined; /// @is {number}
	static h_time_tag = undefined; /// @is {vm_GmlThreadTimeTag}
	static h_error_text = undefined; /// @is {string}
	static h_error_pos = undefined; /// @is {gml_pos}
	static h_get_error = function() {
		return self.h_error_text;
	}
	static h_get_error_ptr = function() {
		if (self.h_error_pos != undefined) return self.h_error_pos.h_to_string(); else return "?";
	}
	static h_get_callstack = function() {
		var l_q = self.h_scope;
		var l_n = 0;
		for (var l_qn = l_q; l_qn != undefined; l_qn = l_qn[10/* next */]) {
			l_n++;
		}
		var l_arr = array_create(l_n);
		var l_i = 0;
		for (var l__g1 = l_n; l_i < l__g1; l_i++) {
			var l_p = l_q[2/* offset */] - 1;
			l_arr[@l_i] = gml_std_haxe_enum_tools_getParameter(ds_list_find_value(l_q[1/* actions */], (l_p > 0 ? l_p - 1 : 0)), 0).h_to_string();
			l_q = l_q[10/* next */];
		}
		return l_arr;
	}
	static h_stack_error = function(l_pos, l_e) {
		var l_text;
		if (is_struct(l_e) && variable_struct_exists(l_e, "stacktrace")) {
			l_text = (variable_struct_exists(l_e, "message") ? string(l_e.message) : "(error without a message?)");
			var l_st = l_e.stacktrace;
			var l_i = 0;
			for (var l__g1 = array_length(l_st); l_i < l__g1; l_i++) {
				var l_js = l_st[l_i];
				if (is_string(l_js)) {
					if (gml_std_StringTools_startsWith(l_js, "gml_Script_vm_group_")) {
						l_text += "\n called from vm:" + gml_std_string_substring(l_js, string_length("gml_Script_vm_group_"));
					} else if (gml_std_StringTools_startsWith(l_js, "gml_Script_") || gml_std_StringTools_startsWith(l_js, "gml_Object_")) {
						l_text += "\n called from game:" + gml_std_string_substring(l_js, string_length("gml_Script_"));
					} else l_text += "\n called from " + l_js;
				} else l_text += "\n called from " + string(l_js);
			}
		} else l_text = gml_std_Std_stringify(l_e);
		var l_s = "[error] " + l_text + "\n called from " + l_pos.h_to_string();
		var l_q = self.h_scope;
		if (l_q != undefined) for (l_q = self.h_scope[10/* next */]; l_q != undefined; l_q = l_q[10/* next */]) {
			var l_p = l_q[2/* offset */];
			l_s += "\n called from " + gml_std_haxe_enum_tools_getParameter(ds_list_find_value(l_q[1/* actions */], (l_p > 0 ? l_p - 1 : 0)), 0).h_to_string();
		}
		return l_s;
	}
	static h_proc_error = function(l_text, l_act) {
		var l_pos = gml_std_haxe_enum_tools_getParameter(l_act, 0);
		self.h_error_text = self.h_stack_error(l_pos, l_text);
		self.h_error_pos = l_pos;
		self.h_status = 4;
		return false;
	}
	static h_proc_error2 = function(l_e, l_act) {
		var l_pos = gml_std_haxe_enum_tools_getParameter(l_act, 0);
		self.h_error_text = self.h_stack_error(l_pos, l_e);
		self.h_error_pos = l_pos;
		self.h_status = 4;
		return 1;
	}
	static h_exec = function() {
		var l__gthis = self;
		var l_prevKind = gml_thread_current_kind;
		gml_thread_current_kind = 1;
		var l_previous = gml_thread_current;
		gml_thread_current = self;
		var l_stack;
		var l_scope = self.h_scope;
		var l_actions, l_pos, l_len;
		l_actions = l_scope[1/* actions */];
		l_len = ds_list_size(l_actions);
		l_stack = l_scope[5/* stack */];
		var l__callback;
		self.h_status = 1;
		while (true) {
			var l_proc;
			var l_act = undefined;
			var l_loop = true;
			for (var l_pos = l_scope[2/* offset */]; l_pos < l_len && l_loop; l_pos = l_scope[2/* offset */]) {
				try {
					l_act = ds_list_find_value(l_actions, l_pos);
					l_scope[@2/* offset */] = l_pos + 1;
					var l_ar = l_act.__func__(l__gthis, l_act, l_scope, l_stack);
					if (l__gthis.h_status >= 4) {
						l_loop = false;
					} else if (l_ar == 3) {
						l_scope = l__gthis.h_scope;
						l_actions = l_scope[1/* actions */];
						l_len = ds_list_size(l_actions);
						l_stack = l_scope[5/* stack */];
					}
				} catch (l__g) {
					var l_x = gml_std_haxe_Exception_caught(l__g).h_unwrap();
					l_loop = false;
					if (l_act == undefined) {
						self.h_error_pos = l_scope[9/* program */].h_sources[0].h_get_eof();
						self.h_error_text = self.h_stack_error(self.h_error_pos, "program is destroyed");
						self.h_status = 4;
					} else self.h_proc_error(l_x, l_act);
				}
			}
			if (self.h_status == 4) {
				l_proc = false;
				while (l_scope != undefined) {
					if (l_scope[8/* xhdl */] != undefined) {
						l_scope[@2/* offset */] = l_scope[8/* xhdl */].h_value;
						self.h_status = 1;
						break;
					} else {
						l_scope = l_scope[10/* next */];
						l_proc = true;
					}
				}
				if (l_scope == undefined) {
					self.h_result = undefined;
					l__callback = self.h_callback;
					if (l__callback != undefined) l__callback(self);
					break;
				} else if (l_proc) {
					if (l_scope[7/* with */] != undefined) gml_with_scope_destroy(l_scope[7/* with */]);
					l_actions = l_scope[1/* actions */];
					l_len = ds_list_size(l_actions);
					l_stack = l_scope[5/* stack */];
				}
			} else if (l_scope[2/* offset */] >= l_len && self.h_status == 1) {
				if (l_scope[7/* with */] != undefined) gml_with_scope_destroy(l_scope[7/* with */]);
				delete l_scope[5/* stack */];
				delete l_scope[6/* inst */];
				delete l_scope[4/* locals */];
				l_scope = l_scope[10/* next */];
				if (l_scope != undefined) {
					self.h_scope = l_scope;
					l_actions = l_scope[1/* actions */];
					l_len = ds_list_size(l_actions);
					l_stack = l_scope[5/* stack */];
				} else {
					self.h_status = 3;
					l__callback = self.h_callback;
					if (l__callback != undefined) l__callback(self);
					break;
				}
			} else break;
		}
		gml_thread_current = l_previous;
		gml_thread_current_kind = l_prevKind;
	}
	static h_fork = function() {
		var l_q = self.h_scope;
		var l_q_inst = l_q[6/* inst */];
		var l_r = new gml_thread(l_q[9/* program */], l_q[1/* actions */], gml_value_list_copy(l_q[3/* args */]), gml_value_list_copy(l_q[4/* locals */]), l_q_inst[l_q_inst[0]], l_q_inst[l_q_inst[0] - 1], l_q[2/* offset */]);
		l_r.h_callback = self.h_callback;
		var l_n = l_r.h_scope;
		l_n[@6/* inst */] = gml_std_gml_internal_ArrayImpl_copy(l_q_inst);
		l_n[@5/* stack */] = gml_std_gml_internal_ArrayImpl_copy(l_q[5/* stack */]);
		l_n[@7/* with */] = gml_with_scope_copy(l_q[7/* with */]);
		return l_r;
	}
	if (l_offset == undefined) l_offset = 0;
	if (false) show_debug_message(argument[6]);
	self.h_error_pos = undefined;
	self.h_error_text = undefined;
	self.h_time_tag = undefined;
	self.h_callback = undefined;
	self.h_status = 0;
	self.h_result = undefined;
	self.h_callback = gml_thread_default_callback;
	if (l_self1 == undefined) l_self1 = live_custom_self;
	if (l_other1 == undefined) l_other1 = live_custom_other;
	if (l_self1 == undefined) l_self1 = live_custom_self;
	if (l_other1 == undefined) l_other1 = live_custom_other;
	self.h_scope = gml_thread_scope_create(l_actions, l_offset, l_args1, l_locals, l_self1, l_other1, undefined, l_program);
	//
}

if (live_enabled) 
function gml_thread_error(l_text) {
	show_error(l_text, true);
	return undefined;
}

#endregion
