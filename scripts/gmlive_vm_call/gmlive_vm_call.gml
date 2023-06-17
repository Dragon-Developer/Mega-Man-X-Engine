// GMLive.gml (c) YellowAfterlife, 2017+
// PLEASE DO NOT FORGET to remove paid extensions from your project when publishing the source code!
// And if you are using git, you can exclude GMLive by adding
// `scripts/GMLive*` and `extensions/GMLive/` lines to your `.gitignore`.
// Feather disable all

#region vm_group_call

if (live_enabled) 
function vm_group_call_call_value(l_th, l_act, l_v1, l_argArray, l_argOffset, l_n) {
	if (is_method(l_v1)) {
		if (vm_v2_gml_thread_group_call_gml23_call_self_other_soft(l_th, l_act, l_v1, l_argArray, l_argOffset, l_n)) {
			l_th.h_result = vm_group_call_call_func_result;
			return vm_group_call_call_func_status;
		} else return 1;
	}
	if (is_numeric(l_v1)) {
		if (script_exists(l_v1)) {
			if (vm_v2_gml_thread_group_call_gml23_call_self_other_soft(l_th, l_act, l_v1, l_argArray, l_argOffset, l_n)) {
				l_th.h_result = vm_group_call_call_func_result;
				return vm_group_call_call_func_status;
			} else return 1;
		} else return l_th.h_proc_error2("Trying to call invalid script index " + gml_value_print(l_v1), l_act);
	} else return l_th.h_proc_error2("Script index must be a number, got " + gml_value_dump(l_v1), l_act);
}

if (live_enabled) 
function vm_group_call_on_call_script(l_th, l_act, l_scope, l_st) {
	var l_scr = l_act.h_script;
	var l_n = l_act.h_argc;
	var l_arr = [];
	var l_k = l_st[0] - l_n;
	array_copy(l_arr, 0, l_st, l_k + 1, l_n);
	array_copy(l_st, l_k + 1, gml_stack_fill_value_arr, 0, l_n);
	l_st[@0] = l_k;
	var l_args1 = l_arr;
	gml_value_list_pad_to_size_with_null(l_args1, l_scr.h_arguments);
	var l_inst = l_scope[6/* inst */];
	l_th.h_scope = gml_thread_scope_create(l_scr.h_actions, 0, l_args1, array_create(l_scr.h_locals), l_inst[l_inst[0]], l_inst[l_inst[0] - 1], l_scope, l_scope[9/* program */]);
	return 3;
}

if (live_enabled) 
function vm_group_call_on_call_script_id(l_th, l_act, l_scope, l_stack) {
	var l_n = l_act.h_argc;
	var l_v1 = l_stack[l_stack[0] - l_n];
	var l_argOffset = l_stack[0] - l_n + 1;
	l_stack[@0] = (l_stack[0] - (l_n + 1));
	return vm_group_call_call_value(l_th, l_act, l_v1, l_stack, l_argOffset, l_n);
	return 0;
}

if (live_enabled) 
function vm_group_call_on_call_field(l_th, l_act, l_scope, l_stack) {
	var l_s = l_act.h_field;
	var l_n = l_act.h_argc;
	var l_ctx = l_stack[l_stack[0] - l_n];
	var l_argOffset = l_stack[0] - l_n + 1;
	var l_val = undefined;
	var l_notFound = true;
	if (typeof(l_ctx) == "ref" || is_numeric(l_ctx) && l_ctx >= 100000) {
		l_val = variable_instance_get(l_ctx, l_s);
		if (l_val != undefined || variable_instance_exists(l_ctx, l_s)) {
			l_notFound = false;
		} else if (variable_instance_exists(l_ctx, "id")) {
			return l_th.h_proc_error2("`" + gml_std_Std_stringify(l_ctx) + "` (" + object_get_name(l_ctx.object_index) + ") does not have a variable `" + l_s + "`", l_act);
		}
	} else with (l_ctx) {
		l_val = variable_instance_get(self, l_s);
		if (l_val != undefined || variable_instance_exists(self, l_s)) {
			l_notFound = false;
			break;
		} else if (is_struct(l_ctx) && instanceof(l_ctx) == "instance") {
			return l_th.h_proc_error2("`" + gml_std_Std_stringify(self) + "` (" + object_get_name(self.object_index) + ") does not have a variable `" + l_s + "`", l_act);
		} else return l_th.h_proc_error2("`" + gml_std_Std_stringify(self) + "` does not have a variable `" + l_s + "`", l_act);
	}
	if (is_method(l_val)) {
		if (method_get_self(l_val) == undefined) l_val = method(l_ctx, l_val);
		var l_this1 = l_scope[6/* inst */];
		var l_me = l_this1[l_this1[0]];
		with (l_me) {
			var l_tmp;
			try {
				var l_r = vm_group_call_call_value(l_th, l_act, l_val, l_stack, l_argOffset, l_n);
				gml_stack_discard_multi(l_stack, l_n + 1);
				l_tmp = l_r;
			} catch (l__g) {
				var l_x = gml_std_haxe_Exception_caught(l__g).h_unwrap();
				gml_stack_discard_multi(l_stack, l_n + 1);
				l_tmp = l_th.h_proc_error2(l_x, l_act);
			}
			return l_tmp;
		}
	}
	var l_tmp;
	try {
		var l_r = vm_group_call_call_value(l_th, l_act, l_val, l_stack, l_argOffset, l_n);
		gml_stack_discard_multi(l_stack, l_n + 1);
		l_tmp = l_r;
	} catch (l__g) {
		var l_x = gml_std_haxe_Exception_caught(l__g).h_unwrap();
		gml_stack_discard_multi(l_stack, l_n + 1);
		l_tmp = l_th.h_proc_error2(l_x, l_act);
	}
	return l_tmp;
	return 0;
}

if (live_enabled) 
function vm_group_call_on_construct(l_th, l_act, l_scope, l_stack) {
	var l__argc = l_act.h_argc;
	var l_args1 = gml_stack_pop_multi(l_stack, l__argc + 1);
	var l_v1 = l_args1[0];
	if (is_numeric(l_v1)) {
		if (!script_exists((l_v1 | 0))) return l_th.h_proc_error2(gml_value_print(l_v1) + " is not a valid script index.", l_act);
	} else if (is_method(l_v1)) {
		var l_isCtr, l_ctx;
		if (gml_std_haxe_boot_isJS) {
			l_ctx = method_get_self(l_v1);
			l_isCtr = is_struct(l_ctx) && l_ctx[$"live:isConstructor"];
		} else {
			l_isCtr = method_get_index(l_v1) == vm_v2_gml_thread_group_func_literal_ctr_impl;
			l_ctx = (l_isCtr ? method_get_self(l_v1) : undefined);
		}
		if (l_isCtr) {
			with (new vm_v2_GmlStructBase()) {
				gml_std_gml_internal_ArrayImpl_shift(l_args1);
				var l_args2 = l_args1;
				var l_self1 = self;
				var l_result;
				while (true) {
					var l_ctx1 = l_ctx[$"live:context"];
					var l_pg;
					if (l_ctx1 != undefined) {
						var l_livedata = live_live_map.h_obj[$ l_ctx1];
						if (l_livedata == undefined) show_error("Trying to call a nonexistent GMLive program: " + l_ctx1, true);
						l_pg = l_livedata[0/* program */];
						if (l_pg == undefined) {
							live_log("Trying to call a broken GMLive program " + l_ctx1 + ", returning undefined", 2);
							l_result = undefined;
							break;
						}
					} else {
						l_pg = l_ctx[$"live:program"];
						if (l_pg == undefined) show_error("It would appear that you've re-bound a GMLive function to a different scope. Please use live_method() rather than method() to do so.", true);
					}
					live_custom_self = l_self1;
					live_custom_other = other;
					var l_th1 = l_pg.h_call_v(l_ctx[$"live:function"], l_args2, false);
					if (l_th1 == undefined) {
						l_result = undefined;
						break;
					}
					if (l_th1.h_status == 3) {
						l_result = l_th1.h_result;
					} else if (l_th1.h_status == 4) {
						live_log("Runtime error: " + l_th1.h_get_error(), 2);
						l_result = undefined;
					} else l_result = undefined;
					if (true) break;
				}
				l_th.h_result = self;
			}
			return 0;
		}
	} else return l_th.h_proc_error2(gml_value_print(l_v1) + " (" + gml_value_get_type(l_v1) + ") is not a callable type.", l_act);
	if (vm_v2_gml_thread_group_call_gml23_call_construct(l_th, l_act, l_v1, l_args1, 1, l__argc)) {
		l_th.h_result = vm_group_call_call_func_result;
		return vm_group_call_call_func_status;
	} else return 1;
	return 0;
}

if (live_enabled) 
function vm_group_call_on_call_script_with_array(l_th, l_act, l_scope, l_stack) {
	var l_v1, l_arr;
	var l_z = l_stack[0] - 1;
	l_stack[@0] = (l_z - 1);
	l_v1 = l_stack[l_z];
	l_arr = l_stack[l_z + 1];
	l_stack[@l_z] = 0;
	l_stack[@l_z + 1] = 0;
	if (is_array(l_arr)) return vm_group_call_call_value(l_th, l_act, l_v1, l_arr, 0, array_length(l_arr)); else return l_th.h_proc_error2("Expected an array with arguments, got " + gml_value_dump(l_arr), l_act);
	return 0;
}

if (live_enabled) 
function vm_group_call_on_call_func(l_th, l_act, l_scope, l_stack) {
	var l__func = l_act.h_func;
	var l__argc = l_act.h_argc;
	var l__inst = l_act.h_inst;
	var l__out = l_act.h_out;
	var l_k = l_stack[0] - l__argc;
	l_stack[@0] = l_k;
	l_k++;
	if (vm_v2_gml_thread_group_call_gml23_funcs[l__inst + 7](l_th, l_act, l__func, l_stack, l_k, l__argc)) {
		if (l__out) {
			var l_i = l_stack[0] + 1;
			if (l_i >= array_length(l_stack)) l_stack[@array_length(l_stack) * 2] = 0;
			l_stack[@l_i] = vm_group_call_call_func_result;
			l_stack[@0] = l_i;
		}
		return vm_group_call_call_func_status;
	} else return 1;
	return 0;
}

#endregion
