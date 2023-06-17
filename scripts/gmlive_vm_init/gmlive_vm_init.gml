// GMLive.gml (c) YellowAfterlife, 2017+
// PLEASE DO NOT FORGET to remove paid extensions from your project when publishing the source code!
// And if you are using git, you can exclude GMLive by adding
// `scripts/GMLive*` and `extensions/GMLive/` lines to your `.gitignore`.
// Feather disable all

#region vm.v2.gml_thread_v2

if (live_enabled) 
function vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, l_name, l_fn) {
	var l_id = l_map.h_obj[$ l_name];
	if (l_id != undefined) l_funcs[@l_id] = l_fn; else show_error("Can't find " + l_name, true);
}

if (live_enabled) 
function vm_v2_gml_thread_v2_handlers_init() {
	var l_names = gml_std_Type_getEnumConstructs(mt_gml_action);
	var l_map = new haxe_ds_string_map();
	var l_funcs = array_create(array_length(l_names), undefined);
	var l_i = 0;
	for (var l__g1 = array_length(l_names); l_i < l__g1; l_i++) {
		var l_name = l_names[l_i];
		if (gml_std_StringTools_endsWith(l_name, "_hx")) l_name = gml_std_string_substring(l_name, 0, string_length(l_name) - 3);
		l_map.h_obj[$ l_name] = l_i;
		l_funcs[@l_i] = vm_v2_gml_thread_v2_on_unknown;
	}
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "discard", vm_group_stack_on_discard);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "dup", vm_group_stack_on_dup);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "dup2x", vm_group_stack_on_dup2x);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "dup3x", vm_group_stack_on_dup3x);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "dup_in", vm_group_stack_on_dup_in);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "undefined", vm_group_literal_on_undefined);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "number", vm_group_literal_on_number);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "cstring", vm_group_literal_on_cstring);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "const", vm_group_literal_on_const);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "self", vm_group_literal_on_self);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "other", vm_group_literal_on_other);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "result", vm_group_literal_on_result);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "array_decl", vm_group_literal_on_array_decl);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "object_decl", vm_group_literal_on_object_decl);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "bin_op", vm_group_op_on_bin_op);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "un_op", vm_group_op_on_un_op);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "equ_op", vm_group_op_on_equ_op);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "neq_op", vm_group_op_on_neq_op);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "add_int", vm_group_op_on_add_int);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "concat", vm_group_op_on_concat);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "ds_aop", vm_group_op_on_ds_aop);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "arg_count", vm_group_arg_on_arg_count);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "arg_const", vm_group_arg_on_arg_const);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "arg_const_set", vm_group_arg_on_arg_const_set);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "arg_const_aop", vm_group_arg_on_arg_const_aop);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "arg_index", vm_group_arg_on_arg_index);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "arg_index_set", vm_group_arg_on_arg_index_set);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "arg_index_aop", vm_group_arg_on_arg_index_aop);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "local", vm_group_local_on_local);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "local_set", vm_group_local_on_local_set);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "local_aop", vm_group_local_on_local_aop);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "global", vm_group_global_on_global);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "global_set", vm_group_global_on_global_set);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "global_aop", vm_group_global_on_global_aop);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "field", vm_group_field_on_field);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "field_set", vm_group_field_on_field_set);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "field_aop", vm_group_field_on_field_aop);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "self_field", vm_group_field_on_self_field);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "self_field_set", vm_group_field_on_self_field_set);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "self_field_aop", vm_group_field_on_self_field_aop);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "fast_self_field", vm_group_field_on_fast_self_field);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "fast_self_field_set", vm_group_field_on_fast_self_field_set);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "fast_self_field_aop", vm_group_field_on_fast_self_field_aop);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "local_field", vm_group_field_on_local_field);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "local_field_set", vm_group_field_on_local_field_set);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "local_field_aop", vm_group_field_on_local_field_aop);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "fast_local_field", vm_group_field_on_fast_local_field);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "fast_local_field_set", vm_group_field_on_fast_local_field_set);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "fast_local_field_aop", vm_group_field_on_fast_local_field_aop);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "fast_field_aop", vm_group_field_on_fast_field_aop);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "in", vm_group_field_on_in);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "in_const", vm_group_field_on_in_const);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "with_pre", vm_group_with_on_with_pre);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "with_next", vm_group_with_on_with_next);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "with_post", vm_group_with_on_with_post);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "env", vm_group_env_on_env);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "env_set", vm_group_env_on_env_set);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "env_aop", vm_group_env_on_env_aop);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "env1d", vm_group_env_on_env1d);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "env1d_set", vm_group_env_on_env1d_set);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "env1d_aop", vm_group_env_on_env1d_aop);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "index", vm_group_array_on_index);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "index_set", vm_group_array_on_index_set);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "index_aop", vm_group_array_on_index_aop);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "index2d", vm_group_array_on_index2d);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "index2d_set", vm_group_array_on_index2d_set);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "index2d_aop", vm_group_array_on_index2d_aop);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "ensure_array_for_local", vm_group_ensure_plus_on_ensure_array_for_local);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "ensure_array_for_global", vm_group_ensure_plus_on_ensure_array_for_global);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "ensure_array_for_field", vm_group_ensure_plus_on_ensure_array_for_field);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "ensure_array_for_index", vm_group_ensure_plus_on_ensure_array_for_index);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "ensure_array_for_index2d", vm_group_ensure_plus_on_ensure_array_for_index2d);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "alarm", vm_group_alarm_on_alarm);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "alarm_set", vm_group_alarm_on_alarm_set);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "alarm_aop", vm_group_alarm_on_alarm_aop);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "jump", vm_group_jump_on_jump);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "jump_if", vm_group_jump_on_jump_if);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "jump_unless", vm_group_jump_on_jump_unless);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "bool_and", vm_group_jump_on_bool_and);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "bool_or", vm_group_jump_on_bool_or);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "switch", vm_group_jump_on_switch);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "switch_case", vm_group_jump_on_switch_case);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "null_co", vm_group_jump_on_null_co);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "repeat_pre", vm_group_jump_on_repeat_pre);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "repeat_jump", vm_group_jump_on_repeat_jump);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "break", vm_group_jump_on_break);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "continue", vm_group_jump_on_continue);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "return", vm_group_jump_on_return);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "return_const", vm_group_jump_on_return_const);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "wait", vm_group_special_on_wait);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "fork", vm_group_special_on_fork);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "try", vm_group_special_on_try);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "catch", vm_group_special_on_catch);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "finally", vm_group_special_on_finally);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "throw", vm_group_special_on_throw);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_script", vm_group_call_on_call_script);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_script_id", vm_group_call_on_call_script_id);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_script_with_array", vm_group_call_on_call_script_with_array);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func", vm_group_call_on_call_func);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_field", vm_group_call_on_call_field);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "construct", vm_group_call_on_construct);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "func_literal", vm_v2_gml_thread_group_func_literal_on_func_literal);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func0", vm_group_fast_call_on_call_func0);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func0o", vm_group_fast_call_on_call_func0o);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func1", vm_group_fast_call_on_call_func1);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func1o", vm_group_fast_call_on_call_func1o);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func2", vm_group_fast_call_on_call_func2);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func2o", vm_group_fast_call_on_call_func2o);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func3", vm_group_fast_call_on_call_func3);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func3o", vm_group_fast_call_on_call_func3o);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func4", vm_group_fast_call_on_call_func4);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func4o", vm_group_fast_call_on_call_func4o);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func_with_local0", vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local0);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func_with_local0o", vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local0o);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func_with_local1", vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local1);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func_with_local1o", vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local1o);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func_with_local2", vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local2);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func_with_local2o", vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local2o);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func_with_local3", vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local3);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func_with_local3o", vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local3o);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func_with_local4", vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local4);
	vm_v2_gml_thread_v2_handlers_init_set(l_funcs, l_map, "call_func_with_local4o", vm_v2_gml_thread_group_fast_call_with_local_on_call_func_with_local4o);
	return l_funcs;
}

if (live_enabled) 
function vm_v2_gml_thread_v2_ready() {
	vm_v2_gml_thread_v2_handlers = vm_v2_gml_thread_v2_handlers_init();
}

if (live_enabled) 
function vm_v2_gml_thread_v2_on_unknown(l_th, l_act, l_scope, l_st) {
	l_th.h_proc_error("Can't execute " + gml_std_Type_enumConstructor(l_act), l_act);
	return 1;
}

#endregion
