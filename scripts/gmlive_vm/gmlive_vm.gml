// GMLive.gml (c) YellowAfterlife, 2017+
// PLEASE DO NOT FORGET to remove paid extensions from your project when publishing the source code!
// And if you are using git, you can exclude GMLive by adding
// `scripts/GMLive*` and `extensions/GMLive/` lines to your `.gitignore`.
// Feather disable all

#region vm_group_alarm

if (live_enabled) 
function vm_group_alarm_on_alarm(l_th, l_act, l_scope, l_st) {
	var l_z = l_st[0] - 1;
	l_st[@0] = l_z;
	l_st[@l_z] = l_st[l_z].alarm[l_st[l_z + 1]];
	l_st[@l_z + 1] = 0;
	return 0;
}

if (live_enabled) 
function vm_group_alarm_on_alarm_set(l_th, l_act, l_scope, l_st) {
	var l_z = l_st[0] - 2;
	l_st[@0] = (l_z - 1);
	l_st[l_z].alarm[l_st[l_z + 1]] = l_st[l_z + 2];
	l_st[@l_z] = 0;
	l_st[@l_z + 1] = 0;
	l_st[@l_z + 2] = 0;
	return 0;
}

if (live_enabled) 
function vm_group_alarm_on_alarm_aop(l_th, l_act, l_scope, l_st) {
	var l_z = l_st[0] - 2;
	l_st[@0] = (l_z - 1);
	var l_a = l_st[l_z];
	var l_i = l_st[l_z + 1];
	var l_v = l_a.alarm[l_i];
	l_v = vm_group_op_funcs[l_act.h_op](l_v, l_st[l_z + 2]);
	l_a.alarm[l_i] = (l_v | 0);
	l_st[@l_z] = 0;
	l_st[@l_z + 1] = 0;
	l_st[@l_z + 2] = 0;
	return 0;
}

#endregion

#region vm_group_arg

if (live_enabled) 
function vm_group_arg_on_arg_count(l_th, l_act, l_scope, l_st) {
	var l_i = l_st[0] + 1;
	if (l_i >= array_length(l_st)) l_st[@array_length(l_st) * 2] = 0;
	l_st[@l_i] = array_length(l_scope[3/* args */]);
	l_st[@0] = l_i;
	return 0;
}

if (live_enabled) 
function vm_group_arg_on_arg_const(l_th, l_act, l_scope, l_st) {
	var l_i = l_act.h_i;
	var l_args1 = l_scope[3/* args */];
	if (l_i >= 0 && l_i < array_length(l_args1)) {
		var l_i1 = l_st[0] + 1;
		if (l_i1 >= array_length(l_st)) l_st[@array_length(l_st) * 2] = 0;
		l_st[@l_i1] = l_args1[l_i];
		l_st[@0] = l_i1;
	} else return l_th.h_proc_error2("Argument index " + string(l_i) + " is out of range (0.." + string(array_length(l_args1)) + ")", l_act);
	return 0;
}

if (live_enabled) 
function vm_group_arg_on_arg_const_set(l_th, l_act, l_scope, l_st) {
	var l_i = l_act.h_i;
	var l_args1 = l_scope[3/* args */];
	if (l_i >= 0 && l_i < array_length(l_args1)) {
		var l_i1 = l_st[0];
		var l_r = l_st[l_i1];
		l_st[@l_i1] = 0;
		l_st[@0] = (l_i1 - 1);
		l_args1[@l_i] = l_r;
	} else return l_th.h_proc_error2("Argument index " + string(l_i) + " is out of range (0.." + string(array_length(l_args1)) + ")", l_act);
	return 0;
}

if (live_enabled) 
function vm_group_arg_on_arg_const_aop(l_th, l_act, l_scope, l_st) {
	var l_o = l_act.h_o;
	var l_i = l_act.h_i;
	var l_args1 = l_scope[3/* args */];
	if (l_i >= 0 && l_i < array_length(l_args1)) {
		var l_arg = l_args1[l_i];
		var l_i1 = l_st[0];
		var l_val = l_st[l_i1];
		l_st[@l_i1] = 0;
		l_st[@0] = (l_i1 - 1);
		l_val = vm_group_op_funcs[l_o](l_arg, l_val);
		l_args1[@l_i] = l_val;
	} else return l_th.h_proc_error2("Argument index " + string(l_i) + " is out of range (0.." + string(array_length(l_args1)) + ")", l_act);
	return 0;
}

if (live_enabled) 
function vm_group_arg_on_arg_index(l_th, l_act, l_scope, l_st) {
	var l_z = l_st[0];
	var l_k = l_st[l_z];
	if (is_numeric(l_k)) {
		var l_i = (l_k | 0);
		var l_args1 = l_scope[3/* args */];
		if (l_i >= 0 && l_i < array_length(l_args1)) l_st[@l_z] = l_args1[l_i]; else return l_th.h_proc_error2("Argument index " + string(l_i) + " is out of range (0.." + string(array_length(l_args1)) + ")", l_act);
	} else return l_th.h_proc_error2("Index is not a number", l_act);
	return 0;
}

if (live_enabled) 
function vm_group_arg_on_arg_index_set(l_th, l_act, l_scope, l_st) {
	var l_v, l_k;
	var l_z = l_st[0] - 1;
	l_st[@0] = (l_z - 1);
	l_k = l_st[l_z];
	l_v = l_st[l_z + 1];
	l_st[@l_z] = 0;
	l_st[@l_z + 1] = 0;
	if (is_numeric(l_k)) {
		var l_i = (l_k | 0);
		var l_args1 = l_scope[3/* args */];
		if (l_i >= 0 && l_i < array_length(l_args1)) l_args1[@l_i] = l_v; else return l_th.h_proc_error2("Argument index " + string(l_i) + " is out of range (0.." + string(array_length(l_args1)) + ")", l_act);
	} else return l_th.h_proc_error2("Index is not a number", l_act);
	return 0;
}

if (live_enabled) 
function vm_group_arg_on_arg_index_aop(l_th, l_act, l_scope, l_st) {
	var l_o = l_act.h_o;
	var l_v, l_k;
	var l_z = l_st[0] - 1;
	l_st[@0] = (l_z - 1);
	l_k = l_st[l_z];
	l_v = l_st[l_z + 1];
	l_st[@l_z] = 0;
	l_st[@l_z + 1] = 0;
	if (is_numeric(l_k)) {
		var l_i = (l_k | 0);
		var l_args1 = l_scope[3/* args */];
		if (l_i >= 0 && l_i < array_length(l_args1)) {
			l_v = vm_group_op_funcs[l_o](l_args1[l_i], l_v);
			l_args1[@l_i] = l_v;
		} else return l_th.h_proc_error2("Argument index " + string(l_i) + " is out of range (0.." + string(array_length(l_args1)) + ")", l_act);
	} else return l_th.h_proc_error2("Index is not a number", l_act);
	return 0;
}

#endregion

#region vm_group_array

if (live_enabled) 
function vm_group_array_on_index(l_th, l_act, l_scope, l_st) {
	var l_z = l_st[0] - 1;
	l_st[@0] = l_z;
	l_st[@l_z] = l_st[l_z][l_st[l_z + 1]];
	l_st[@l_z + 1] = 0;
	return 0;
}

if (live_enabled) 
function vm_group_array_on_index_set(l_th, l_act, l_scope, l_st) {
	var l_z = l_st[0] - 2;
	l_st[@0] = (l_z - 1);
	l_st[l_z][@l_st[l_z + 1]] = l_st[l_z + 2];
	l_st[@l_z] = 0;
	l_st[@l_z + 1] = 0;
	l_st[@l_z + 2] = 0;
	return 0;
}

if (live_enabled) 
function vm_group_array_on_index_aop(l_th, l_act, l_scope, l_st) {
	var l_z = l_st[0] - 2;
	l_st[@0] = (l_z - 1);
	var l_a = l_st[l_z];
	var l_i = l_st[l_z + 1];
	var l_v;
	l_a[@l_i] = vm_group_op_funcs[l_act.h_o](l_a[l_i], l_st[l_z + 2]);
	l_st[@l_z] = 0;
	l_st[@l_z + 1] = 0;
	l_st[@l_z + 2] = 0;
	return 0;
}

if (live_enabled) 
function vm_group_array_on_index2d(l_th, l_act, l_scope, l_st) {
	var l_a;
	var l_z = l_st[0] - 2;
	l_st[@0] = l_z;
	l_a = l_st[l_z];
	l_st[@l_z] = l_a[l_st[l_z + 1], l_st[l_z + 2]];
	l_st[@l_z + 1] = 0;
	l_st[@l_z + 2] = 0;
	return 0;
}

if (live_enabled) 
function vm_group_array_on_index2d_set(l_th, l_act, l_scope, l_st) {
	var l_arr;
	var l_z = l_st[0] - 3;
	l_st[@0] = (l_z - 1);
	l_arr = l_st[l_z];
	l_arr[@l_st[l_z + 1], l_st[l_z + 2]] = l_st[l_z + 3];
	l_st[@l_z] = 0;
	l_st[@l_z + 1] = 0;
	l_st[@l_z + 2] = 0;
	l_st[@l_z + 3] = 0;
	return 0;
}

if (live_enabled) 
function vm_group_array_on_index2d_aop(l_th, l_act, l_scope, l_st) {
	var l_z = l_st[0] - 3;
	l_st[@0] = (l_z - 1);
	var l_a = l_st[l_z];
	var l_i = l_st[l_z + 1];
	var l_k = l_st[l_z + 2];
	l_a[@l_i, l_k] = vm_group_op_funcs[l_act.h_o](l_a[l_i, l_k], l_st[l_z + 3]);
	l_st[@l_z] = 0;
	l_st[@l_z + 1] = 0;
	l_st[@l_z + 2] = 0;
	l_st[@l_z + 3] = 0;
	return 0;
}

#endregion

#region vm_group_ensure_plus

if (live_enabled) 
function vm_group_ensure_plus_on_ensure_array_for_local(l_th, l_act, l_scope, l_st) {
	var l_ind = l_act.h_ind;
	var l_locals = l_scope[4/* locals */];
	var l_val = l_locals[l_ind];
	if (!is_array(l_val)) {
		l_val = [];
		l_locals[@l_ind] = l_val;
	}
	var l_i = l_st[0] + 1;
	if (l_i >= array_length(l_st)) l_st[@array_length(l_st) * 2] = 0;
	l_st[@l_i] = l_val;
	l_st[@0] = l_i;
	return 0;
}

if (live_enabled) 
function vm_group_ensure_plus_on_ensure_array_for_global(l_th, l_act, l_scope, l_st) {
	var l_name = l_act.h_name;
	var l_val = variable_global_get(l_name);
	if (!is_array(l_val)) {
		l_val = [];
		variable_global_set(l_name, l_val);
	}
	var l_i = l_st[0] + 1;
	if (l_i >= array_length(l_st)) l_st[@array_length(l_st) * 2] = 0;
	l_st[@l_i] = l_val;
	l_st[@0] = l_i;
	return 0;
}

if (live_enabled) 
function vm_group_ensure_plus_on_ensure_array_for_field(l_th, l_act, l_scope, l_st) {
	var l_name = l_act.h_field;
	var l_z = l_st[0];
	var l_obj = l_st[l_z];
	var l_val = variable_instance_get(l_obj, l_name);
	if (!is_array(l_val)) {
		l_val = [];
		variable_instance_set(l_obj, l_name, l_val);
	}
	l_st[@l_z] = l_val;
	return 0;
}

if (live_enabled) 
function vm_group_ensure_plus_on_ensure_array_for_index(l_th, l_act, l_scope, l_st) {
	var l_z = l_st[0] - 1;
	l_st[@0] = l_z;
	var l_arr = l_st[l_z];
	var l_ind = l_st[l_z + 1];
	var l_val;
	if (l_ind < array_length(l_arr)) {
		l_val = l_arr[l_ind];
		if (!is_array(l_val)) {
			l_val = [];
			l_arr[@l_ind] = l_val;
		}
	} else {
		l_val = [];
		l_arr[@l_ind] = l_val;
	}
	l_st[@l_z] = l_val;
	l_st[@l_z + 1] = 0;
	return 0;
}

if (live_enabled) 
function vm_group_ensure_plus_on_ensure_array_for_index2d(l_th, l_act, l_scope, l_st) {
	var l_z = l_st[0] - 2;
	l_st[@0] = l_z;
	var l_arr = l_st[l_z];
	var l_val;
	var l_ind = l_st[l_z + 1];
	if (l_ind < array_length(l_arr)) {
		l_val = l_arr[l_ind];
		if (!is_array(l_val)) {
			l_val = [];
			l_arr[@l_ind] = l_val;
		}
	} else {
		l_val = [];
		l_arr[@l_ind] = l_val;
	}
	l_arr = l_val;
	var l_ind = l_st[l_z + 2];
	if (l_ind < array_length(l_arr)) {
		l_val = l_arr[l_ind];
		if (!is_array(l_val)) {
			l_val = [];
			l_arr[@l_ind] = l_val;
		}
	} else {
		l_val = [];
		l_arr[@l_ind] = l_val;
	}
	l_arr = l_val;
	l_st[@l_z] = l_val;
	l_st[@l_z + 1] = 0;
	l_st[@l_z + 2] = 0;
	return 0;
}

#endregion

#region vm_group_env

if (live_enabled) 
function vm_group_env_on_env(l_th, l_act, l_scope, l_st) {
	var l_v = l_act.h_f(false, undefined);
	var l_i = l_st[0] + 1;
	if (l_i >= array_length(l_st)) l_st[@array_length(l_st) * 2] = 0;
	l_st[@l_i] = l_v;
	l_st[@0] = l_i;
	return 0;
}

if (live_enabled) 
function vm_group_env_on_env_set(l_th, l_act, l_scope, l_st) {
	var l_i = l_st[0];
	var l_r = l_st[l_i];
	l_st[@l_i] = 0;
	l_st[@0] = (l_i - 1);
	l_act.h_f(true, l_r);
	return 0;
}

if (live_enabled) 
function vm_group_env_on_env_aop(l_th, l_act, l_scope, l_st) {
	var l_op = l_act.h_o;
	var l_fn = l_act.h_f;
	var l_ev = l_fn(false, undefined);
	var l_i = l_st[0];
	var l_r = l_st[l_i];
	l_st[@l_i] = 0;
	l_st[@0] = (l_i - 1);
	l_ev = vm_group_op_funcs[l_op](l_ev, l_r);
	l_fn(true, l_ev);
	return 0;
}

if (live_enabled) 
function vm_group_env_on_env1d(l_th, l_act, l_scope, l_st) {
	var l_fn = l_act.h_f;
	var l_z = l_st[0];
	var l_i = l_st[l_z];
	if (is_numeric(l_i)) l_st[@l_z] = l_fn(false, undefined, (l_i | 0)); else return l_th.h_proc_error2("Index " + gml_value_print(l_i) + " is not a number.", l_act);
	return 0;
}

if (live_enabled) 
function vm_group_env_on_env1d_set(l_th, l_act, l_scope, l_st) {
	var l_fn = l_act.h_f;
	var l_i, l_v;
	var l_z = l_st[0] - 1;
	l_st[@0] = (l_z - 1);
	l_i = l_st[l_z];
	l_v = l_st[l_z + 1];
	l_st[@l_z] = 0;
	l_st[@l_z + 1] = 0;
	if (is_numeric(l_i)) l_fn(true, l_v, (l_i | 0)); else return l_th.h_proc_error2("Index " + gml_value_print(l_i) + " is not a number.", l_act);
	return 0;
}

if (live_enabled) 
function vm_group_env_on_env1d_aop(l_th, l_act, l_scope, l_st) {
	var l_o = l_act.h_o;
	var l_fn = l_act.h_f;
	var l_i, l_v;
	var l_z = l_st[0] - 1;
	l_st[@0] = (l_z - 1);
	l_i = l_st[l_z];
	l_v = l_st[l_z + 1];
	l_st[@l_z] = 0;
	l_st[@l_z + 1] = 0;
	if (!is_numeric(l_i)) return l_th.h_proc_error2("Index " + gml_value_print(l_i) + " is not a number.", l_act);
	var l_ev = l_fn(false, undefined, (l_i | 0));
	l_ev = vm_group_op_funcs[l_o](l_ev, l_v);
	l_fn(true, l_ev, (l_i | 0));
	return 0;
}

#endregion

#region vm_group_fast_call

if (live_enabled) 
function vm_group_fast_call_on_call_func0(l_th, l_act, l_scope, l_st) {
	l_act.h_func();
	return 0;
}

if (live_enabled) 
function vm_group_fast_call_on_call_func0o(l_th, l_act, l_scope, l_st) {
	var l_v = l_act.h_func();
	var l_i = l_st[0] + 1;
	if (l_i >= array_length(l_st)) l_st[@array_length(l_st) * 2] = 0;
	l_st[@l_i] = l_v;
	l_st[@0] = l_i;
	return 0;
}

if (live_enabled) 
function vm_group_fast_call_on_call_func1(l_th, l_act, l_scope, l_st) {
	var l__func = l_act.h_func;
	var l_i = l_st[0];
	var l_r = l_st[l_i];
	l_st[@l_i] = 0;
	l_st[@0] = (l_i - 1);
	l__func(l_r);
	return 0;
}

if (live_enabled) 
function vm_group_fast_call_on_call_func1o(l_th, l_act, l_scope, l_st) {
	var l_z = l_st[0];
	l_st[@l_z] = l_act.h_func(l_st[l_z]);
	return 0;
}

if (live_enabled) 
function vm_group_fast_call_on_call_func2(l_th, l_act, l_scope, l_st) {
	var l_z = l_st[0] - 1;
	l_st[@0] = (l_z - 1);
	l_act.h_func(l_st[l_z], l_st[l_z + 1]);
	l_st[@l_z] = 0;
	l_st[@l_z + 1] = 0;
	return 0;
}

if (live_enabled) 
function vm_group_fast_call_on_call_func2o(l_th, l_act, l_scope, l_st) {
	var l_z = l_st[0] - 1;
	l_st[@0] = l_z;
	l_st[@l_z] = l_act.h_func(l_st[l_z], l_st[l_z + 1]);
	l_st[@l_z + 1] = 0;
	return 0;
}

if (live_enabled) 
function vm_group_fast_call_on_call_func3(l_th, l_act, l_scope, l_st) {
	var l_z = l_st[0] - 2;
	l_st[@0] = (l_z - 1);
	l_act.h_func(l_st[l_z], l_st[l_z + 1], l_st[l_z + 2]);
	l_st[@l_z] = 0;
	l_st[@l_z + 1] = 0;
	l_st[@l_z + 2] = 0;
	return 0;
}

if (live_enabled) 
function vm_group_fast_call_on_call_func3o(l_th, l_act, l_scope, l_st) {
	var l_z = l_st[0] - 2;
	l_st[@0] = l_z;
	l_st[@l_z] = l_act.h_func(l_st[l_z], l_st[l_z + 1], l_st[l_z + 2]);
	l_st[@l_z + 1] = 0;
	l_st[@l_z + 2] = 0;
	return 0;
}

if (live_enabled) 
function vm_group_fast_call_on_call_func4(l_th, l_act, l_scope, l_st) {
	var l_z = l_st[0] - 3;
	l_st[@0] = (l_z - 1);
	l_act.h_func(l_st[l_z], l_st[l_z + 1], l_st[l_z + 2], l_st[l_z + 3]);
	l_st[@l_z] = 0;
	l_st[@l_z + 1] = 0;
	l_st[@l_z + 2] = 0;
	l_st[@l_z + 3] = 0;
	return 0;
}

if (live_enabled) 
function vm_group_fast_call_on_call_func4o(l_th, l_act, l_scope, l_st) {
	var l_z = l_st[0] - 3;
	l_st[@0] = l_z;
	l_st[@l_z] = l_act.h_func(l_st[l_z], l_st[l_z + 1], l_st[l_z + 2], l_st[l_z + 3]);
	l_st[@l_z + 1] = 0;
	l_st[@l_z + 2] = 0;
	l_st[@l_z + 3] = 0;
	return 0;
}

#endregion

#region vm_group_field

if (live_enabled) 
function vm_group_field_dump_no_var(l_th, l_act, l_ctx, l_fd) {
	var l_post = " does not have a variable `" + l_fd + "`";
	if (is_numeric(l_ctx)) {
		if (object_exists(l_ctx)) {
			return l_th.h_proc_error2(gml_std_Std_stringify(l_ctx) + " (" + object_get_name(l_ctx) + l_post, l_act);
		} else if (variable_instance_exists(l_ctx, "id")) {
			return l_th.h_proc_error2(gml_std_Std_stringify(l_ctx) + " (" + object_get_name(l_ctx.object_index) + ")" + l_post, l_act);
		} else return l_th.h_proc_error2(gml_value_print(l_ctx) + l_post, l_act);
	} else if (instanceof(l_ctx) == "instance") {
		return l_th.h_proc_error2(string(l_ctx.id) + " (" + object_get_name(l_ctx.object_index) + ")" + l_post, l_act);
	} else {
		var l_val = l_ctx;
		return l_th.h_proc_error2(gml_value_print(l_val) + " (" + gml_value_get_type(l_val) + ")" + l_post, l_act);
	}
}

if (live_enabled) 
function vm_group_field_on_field(l_th, l_act, l_scope, l_st) {
	var l_s = l_act.h_fd;
	var l_z = l_st[0];
	var l_ctx = l_st[l_z];
	var l_val;
	if (typeof(l_ctx) == "ref" || is_numeric(l_ctx) && l_ctx >= 100000) {
		l_val = variable_instance_get(l_ctx, l_s);
		if (l_val != undefined || variable_instance_exists(l_ctx, l_s)) {
			l_st[@l_z] = l_val;
			return 0;
		}
		if (variable_instance_exists(l_ctx, "id")) return vm_group_field_dump_no_var(l_th, l_act, l_ctx, l_s);
	} else with (l_ctx) {
		l_val = variable_instance_get(self, l_s);
		if (l_val != undefined || variable_instance_exists(self, l_s)) {
			l_st[@l_z] = l_val;
			return 0;
		}
		return vm_group_field_dump_no_var(l_th, l_act, l_ctx, l_s);
	}
	if (is_numeric(l_ctx) && object_exists(l_ctx)) return l_th.h_proc_error2("Couldn't find any instances of " + gml_std_Std_stringify(l_ctx) + " (" + object_get_name(l_ctx) + ")", l_act); else return l_th.h_proc_error2("Couldn't find any instances of " + gml_std_Std_stringify(l_ctx) + ".", l_act);
	return 0;
}

if (live_enabled) 
function vm_group_field_on_field_set(l_th, l_act, l_scope, l_st) {
	var l_varname = l_act.h_fd;
	var l_z = l_st[0] - 1;
	l_st[@0] = (l_z - 1);
	var l_ctx = l_st[l_z];
	var l_val = l_st[l_z + 1];
	var l_checkExists;
	if (typeof(l_ctx) == "ref" || is_numeric(l_ctx) && l_ctx >= 100000) {
		try {
			l_checkExists = l_ctx.id
		} catch (l__g) {
			var l_x = gml_std_haxe_Exception_caught(l__g).h_unwrap();
			l_st[@l_z] = 0;
			l_st[@l_z + 1] = 0;
			return l_th.h_proc_error2(l_x, l_act);
		}
		variable_instance_set(l_ctx, l_varname, l_val);
		l_st[@l_z] = 0;
		l_st[@l_z + 1] = 0;
		return 0;
	} else with (l_ctx) {
		variable_instance_set(self, l_varname, l_val);
		l_st[@l_z] = 0;
		l_st[@l_z + 1] = 0;
		return 0;
	}
	l_st[@l_z] = 0;
	l_st[@l_z + 1] = 0;
	if (is_numeric(l_ctx) && object_exists(l_ctx)) return l_th.h_proc_error2("Couldn't find any instances of " + gml_std_Std_stringify(l_ctx) + " (" + object_get_name(l_ctx) + ")", l_act); else return l_th.h_proc_error2("Couldn't find any instances of " + gml_std_Std_stringify(l_ctx) + ".", l_act);
	return 0;
}

if (live_enabled) 
function vm_group_field_on_fast_field_aop(l_th, l_act, l_scope, l_st) {
	var l_z = l_st[0] - 1;
	l_st[@0] = (l_z - 1);
	var l_obj = l_st[l_z];
	l_act.h_setter(l_obj, vm_group_op_funcs[l_act.h_o](l_act.h_getter(l_obj), l_st[l_z + 1]));
	l_st[@l_z] = 0;
	l_st[@l_z + 1] = 0;
	return 0;
}

if (live_enabled) 
function vm_group_field_on_field_aop(l_th, l_act, l_scope, l_st) {
	var l_o = l_act.h_o;
	var l_s = l_act.h_fd;
	var l_z = l_st[0] - 1;
	l_st[@0] = (l_z - 1);
	var l_ctx = l_st[l_z];
	var l_val = l_st[l_z + 1];
	var l_checkExists, l_cur;
	if (typeof(l_ctx) == "ref" || is_numeric(l_ctx) && l_ctx >= 100000) {
		try {
			l_checkExists = l_ctx.id
		} catch (l__g) {
			var l_x = gml_std_haxe_Exception_caught(l__g).h_unwrap();
			l_st[@l_z] = 0;
			l_st[@l_z + 1] = 0;
			return l_th.h_proc_error2(l_x, l_act);
		}
		l_cur = variable_instance_get(l_ctx, l_s);
		if (l_cur != undefined || variable_instance_exists(l_ctx, l_s)) {
			l_cur = vm_group_op_funcs[l_o](l_cur, l_val);
			variable_instance_set(l_ctx, l_s, l_cur);
			l_st[@l_z] = 0;
			l_st[@l_z + 1] = 0;
			return 0;
		} else {
			l_st[@l_z] = 0;
			l_st[@l_z + 1] = 0;
			return l_th.h_proc_error2("`" + gml_std_Std_stringify(l_ctx) + "` (" + object_get_name(l_ctx.object_index) + ") does not have a variable `" + l_s + "`", l_act);
		}
	} else {
		l_checkExists = false;
		with (l_ctx) {
			l_cur = variable_instance_get(self, l_s);
			if (l_cur != undefined || variable_instance_exists(l_ctx, l_s)) {
				l_cur = vm_group_op_funcs[l_o](l_cur, l_val);
				variable_instance_set(self, l_s, l_cur);
				l_checkExists = true;
			} else if (is_numeric(l_ctx)) {
				l_st[@l_z] = 0;
				l_st[@l_z + 1] = 0;
				return l_th.h_proc_error2("`" + gml_std_Std_stringify(l_ctx) + "` (" + object_get_name(l_ctx.object_index) + ") does not have a variable `" + l_s + "`", l_act);
			} else {
				l_st[@l_z] = 0;
				l_st[@l_z + 1] = 0;
				return l_th.h_proc_error2("`" + gml_value_print(l_ctx) + "` (" + typeof(l_ctx) + ") does not have a variable `" + l_s + "`", l_act);
			}
		}
		if (l_checkExists) {
			l_st[@l_z] = 0;
			l_st[@l_z + 1] = 0;
			return 0;
		}
	}
	l_st[@l_z] = 0;
	l_st[@l_z + 1] = 0;
	if (is_numeric(l_ctx) && object_exists(l_ctx)) return l_th.h_proc_error2("Couldn't find any instances of " + gml_std_Std_stringify(l_ctx) + " (" + object_get_name(l_ctx) + ")", l_act); else return l_th.h_proc_error2("Couldn't find any instances of " + gml_std_Std_stringify(l_ctx) + ".", l_act);
	return 0;
}

if (live_enabled) 
function vm_group_field_on_self_field(l_th, l_act, l_scope, l_st) {
	var l__field = l_act.h_fd;
	var l_this1 = l_scope[6/* inst */];
	var l_obj = l_this1[l_this1[0]];
	var l_val = l_obj[$ l__field];
	if (l_val == undefined) {
		if (!variable_struct_exists(l_obj, l__field)) {
			if (is_numeric(l_obj)) {
				if (object_exists(l_obj)) {
					gml_thread_error(gml_std_Std_stringify(l_obj) + " (" + object_get_name(l_obj) + ") does not have a variable `" + l__field + "`.");
				} else if (instance_exists(l_obj)) {
					gml_thread_error(gml_std_Std_stringify(l_obj) + " (" + object_get_name(l_obj.object_index) + ") does not have a variable `" + l__field + "`.");
				} else gml_thread_error(gml_value_dump(l_obj) + " does not have a variable `" + l__field + "`.");
			} else if (typeof(l_obj) == "ref") {
				if (instance_exists(l_obj)) gml_thread_error(gml_std_Std_stringify(l_obj) + " (" + object_get_name(l_obj.object_index) + ") does not have a variable `" + l__field + "`."); else gml_thread_error(gml_value_dump(l_obj) + " does not have a variable `" + l__field + "`.");
			} else gml_thread_error(gml_value_dump(l_obj) + " does not have a variable `" + l__field + "`.");
		}
	}
	var l_i = l_st[0] + 1;
	if (l_i >= array_length(l_st)) l_st[@array_length(l_st) * 2] = 0;
	l_st[@l_i] = l_val;
	l_st[@0] = l_i;
	return 0;
}

if (live_enabled) 
function vm_group_field_on_self_field_set(l_th, l_act, l_scope, l_st) {
	var l__field = l_act.h_fd;
	var l_this1 = l_scope[6/* inst */];
	l_this1[l_this1[0]][$ l__field] = gml_stack_pop(l_st);
	return 0;
}

if (live_enabled) 
function vm_group_field_on_self_field_aop(l_th, l_act, l_scope, l_st) {
	var l__op = l_act.h_o;
	var l__field = l_act.h_fd;
	var l_this1 = l_scope[6/* inst */];
	var l_obj = l_this1[l_this1[0]];
	var l_cur = l_obj[$ l__field];
	if (l_cur == undefined) {
		if (!variable_struct_exists(l_obj, l__field)) {
			if (is_numeric(l_obj)) {
				if (object_exists(l_obj)) {
					gml_thread_error(gml_std_Std_stringify(l_obj) + " (" + object_get_name(l_obj) + ") does not have a variable `" + l__field + "`.");
				} else if (instance_exists(l_obj)) {
					gml_thread_error(gml_std_Std_stringify(l_obj) + " (" + object_get_name(l_obj.object_index) + ") does not have a variable `" + l__field + "`.");
				} else gml_thread_error(gml_value_dump(l_obj) + " does not have a variable `" + l__field + "`.");
			} else if (typeof(l_obj) == "ref") {
				if (instance_exists(l_obj)) gml_thread_error(gml_std_Std_stringify(l_obj) + " (" + object_get_name(l_obj.object_index) + ") does not have a variable `" + l__field + "`."); else gml_thread_error(gml_value_dump(l_obj) + " does not have a variable `" + l__field + "`.");
			} else gml_thread_error(gml_value_dump(l_obj) + " does not have a variable `" + l__field + "`.");
		}
	}
	var l_this1 = l_scope[6/* inst */];
	l_this1[l_this1[0]][$ l__field] = vm_group_op_funcs[l__op](l_cur, gml_stack_pop(l_st));
	return 0;
}

if (live_enabled) 
function vm_group_field_on_fast_self_field(l_th, l_act, l_scope, l_st) {
	var l_this1 = l_scope[6/* inst */];
	var l_v = l_act.h_getter(l_this1[l_this1[0]]);
	var l_i = l_st[0] + 1;
	if (l_i >= array_length(l_st)) l_st[@array_length(l_st) * 2] = 0;
	l_st[@l_i] = l_v;
	l_st[@0] = l_i;
	return 0;
}

if (live_enabled) 
function vm_group_field_on_fast_self_field_set(l_th, l_act, l_scope, l_st) {
	var l__setter = l_act.h_setter;
	var l_this1 = l_scope[6/* inst */];
	l__setter(l_this1[l_this1[0]], gml_stack_pop(l_st));
	return 0;
}

if (live_enabled) 
function vm_group_field_on_fast_self_field_aop(l_th, l_act, l_scope, l_st) {
	var l_this1 = l_scope[6/* inst */];
	var l_obj = l_this1[l_this1[0]];
	l_act.h_setter(l_obj, vm_group_op_funcs[l_act.h_o](l_act.h_getter(l_obj), gml_stack_pop(l_st)));
	return 0;
}

if (live_enabled) 
function vm_group_field_on_local_field(l_th, l_act, l_scope, l_st) {
	var l_i = l_act.h_localIndex;
	var l__field = l_act.h_fd;
	var l_obj = l_scope[4/* locals */][l_i];
	var l_val = l_obj[$ l__field];
	if (l_val == undefined) {
		if (!variable_struct_exists(l_obj, l__field)) {
			if (is_numeric(l_obj)) {
				if (object_exists(l_obj)) {
					gml_thread_error(gml_std_Std_stringify(l_obj) + " (" + object_get_name(l_obj) + ") does not have a variable `" + l__field + "`.");
				} else if (instance_exists(l_obj)) {
					gml_thread_error(gml_std_Std_stringify(l_obj) + " (" + object_get_name(l_obj.object_index) + ") does not have a variable `" + l__field + "`.");
				} else gml_thread_error(gml_value_dump(l_obj) + " does not have a variable `" + l__field + "`.");
			} else if (typeof(l_obj) == "ref") {
				if (instance_exists(l_obj)) gml_thread_error(gml_std_Std_stringify(l_obj) + " (" + object_get_name(l_obj.object_index) + ") does not have a variable `" + l__field + "`."); else gml_thread_error(gml_value_dump(l_obj) + " does not have a variable `" + l__field + "`.");
			} else gml_thread_error(gml_value_dump(l_obj) + " does not have a variable `" + l__field + "`.");
		}
	}
	var l_i = l_st[0] + 1;
	if (l_i >= array_length(l_st)) l_st[@array_length(l_st) * 2] = 0;
	l_st[@l_i] = l_val;
	l_st[@0] = l_i;
	return 0;
}

if (live_enabled) 
function vm_group_field_on_local_field_set(l_th, l_act, l_scope, l_st) {
	l_scope[4/* locals */][l_act.h_localIndex][$ l_act.h_fd] = gml_stack_pop(l_st);
	return 0;
}

if (live_enabled) 
function vm_group_field_on_local_field_aop(l_th, l_act, l_scope, l_st) {
	var l_i = l_act.h_localIndex;
	var l__op = l_act.h_o;
	var l__field = l_act.h_fd;
	var l_obj = l_scope[4/* locals */][l_i];
	var l_cur = l_obj[$ l__field];
	if (l_cur == undefined) {
		if (!variable_struct_exists(l_obj, l__field)) {
			if (is_numeric(l_obj)) {
				if (object_exists(l_obj)) {
					gml_thread_error(gml_std_Std_stringify(l_obj) + " (" + object_get_name(l_obj) + ") does not have a variable `" + l__field + "`.");
				} else if (instance_exists(l_obj)) {
					gml_thread_error(gml_std_Std_stringify(l_obj) + " (" + object_get_name(l_obj.object_index) + ") does not have a variable `" + l__field + "`.");
				} else gml_thread_error(gml_value_dump(l_obj) + " does not have a variable `" + l__field + "`.");
			} else if (typeof(l_obj) == "ref") {
				if (instance_exists(l_obj)) gml_thread_error(gml_std_Std_stringify(l_obj) + " (" + object_get_name(l_obj.object_index) + ") does not have a variable `" + l__field + "`."); else gml_thread_error(gml_value_dump(l_obj) + " does not have a variable `" + l__field + "`.");
			} else gml_thread_error(gml_value_dump(l_obj) + " does not have a variable `" + l__field + "`.");
		}
	}
	l_obj[$ l__field] = vm_group_op_funcs[l__op](l_cur, gml_stack_pop(l_st));
	return 0;
}

if (live_enabled) 
function vm_group_field_on_fast_local_field(l_th, l_act, l_scope, l_st) {
	var l_v = l_act.h_getter(l_scope[4/* locals */][l_act.h_localIndex]);
	var l_i = l_st[0] + 1;
	if (l_i >= array_length(l_st)) l_st[@array_length(l_st) * 2] = 0;
	l_st[@l_i] = l_v;
	l_st[@0] = l_i;
	return 0;
}

if (live_enabled) 
function vm_group_field_on_fast_local_field_set(l_th, l_act, l_scope, l_st) {
	l_act.h_setter(l_scope[4/* locals */][l_act.h_localIndex], gml_stack_pop(l_st));
	return 0;
}

if (live_enabled) 
function vm_group_field_on_fast_local_field_aop(l_th, l_act, l_scope, l_st) {
	var l_obj = l_scope[4/* locals */][l_act.h_localIndex];
	l_act.h_setter(l_obj, vm_group_op_funcs[l_act.h_o](l_act.h_getter(l_obj), gml_stack_pop(l_st)));
	return 0;
}

if (live_enabled) 
function vm_group_field_on_in(l_th, l_act, l_scope, l_st) {
	var l_not = l_act.h_not;
	var l_z = l_st[0] - 1;
	l_st[@0] = l_z;
	var l_ctx = l_st[l_z + 1];
	if (typeof(l_ctx) == "ref" || is_numeric(l_ctx) && l_ctx >= 100000) {
		l_st[@l_z] = l_not != variable_instance_exists(l_ctx, l_st[l_z]);
		return 0;
	} else with (l_ctx) {
		l_st[@l_z] = l_not != variable_instance_exists(self, l_st[l_z]);
		return 0;
	}
	if (is_numeric(l_ctx) && object_exists(l_ctx)) return l_th.h_proc_error2("Couldn't find any instances of " + gml_std_Std_stringify(l_ctx) + " (" + object_get_name(l_ctx) + ")", l_act); else return l_th.h_proc_error2("Couldn't find any instances of " + gml_std_Std_stringify(l_ctx) + ".", l_act);
	return 0;
}

if (live_enabled) 
function vm_group_field_on_in_const(l_th, l_act, l_scope, l_st) {
	var l_z = l_st[0];
	l_st[@l_z] = l_act.h_not != variable_struct_exists(l_st[l_z], l_act.h_field);
	return 0;
}

#endregion

#region vm_group_global

if (live_enabled) 
function vm_group_global_on_global(l_th, l_act, l_scope, l_st) {
	var l_s = l_act.h_fd;
	if (variable_global_exists(l_s)) {
		var l_v = variable_global_get(l_s);
		var l_i = l_st[0] + 1;
		if (l_i >= array_length(l_st)) l_st[@array_length(l_st) * 2] = 0;
		l_st[@l_i] = l_v;
		l_st[@0] = l_i;
	} else return l_th.h_proc_error2("Global variable `" + l_s + "` is not set.", l_act);
	return 0;
}

if (live_enabled) 
function vm_group_global_on_global_set(l_th, l_act, l_scope, l_st) {
	var l_i = l_st[0];
	var l_r = l_st[l_i];
	l_st[@l_i] = 0;
	l_st[@0] = (l_i - 1);
	variable_global_set(l_act.h_fd, l_r);
	return 0;
}

if (live_enabled) 
function vm_group_global_on_global_aop(l_th, l_act, l_scope, l_st) {
	var l_o = l_act.h_o;
	var l_s = l_act.h_fd;
	if (variable_global_exists(l_s)) {
		var l_i = l_st[0];
		var l_r = l_st[l_i];
		l_st[@l_i] = 0;
		l_st[@0] = (l_i - 1);
		variable_global_set(l_s, vm_group_op_funcs[l_o](variable_global_get(l_s), l_r));
	} else return l_th.h_proc_error2("Global variable `" + l_s + "` is not set.", l_act);
	return 0;
}

#endregion

#region vm_group_jump

if (live_enabled) 
function vm_group_jump_on_jump(l_th, l_act, l_scope, l_st) {
	l_scope[@2/* offset */] = l_act.h_p;
	return 2;
}

if (live_enabled) 
function vm_group_jump_on_jump_if(l_th, l_act, l_scope, l_st) {
	var l_p = l_act.h_p;
	var l_i = l_st[0];
	var l_r = l_st[l_i];
	l_st[@l_i] = 0;
	l_st[@0] = (l_i - 1);
	if (l_r) {
		l_scope[@2/* offset */] = l_p;
		return 2;
	}
	return 0;
}

if (live_enabled) 
function vm_group_jump_on_jump_unless(l_th, l_act, l_scope, l_st) {
	var l_p = l_act.h_p;
	var l_i = l_st[0];
	var l_r = l_st[l_i];
	l_st[@l_i] = 0;
	l_st[@0] = (l_i - 1);
	if (!l_r) {
		l_scope[@2/* offset */] = l_p;
		return 2;
	}
	return 0;
}

if (live_enabled) 
function vm_group_jump_on_bool_and(l_th, l_act, l_scope, l_st) {
	var l_p = l_act.h_p;
	if (l_st[l_st[0]]) {
		var l_i = l_st[0];
		l_st[@l_i] = 0;
		l_st[@0] = (l_i - 1);
	} else {
		l_scope[@2/* offset */] = l_p;
		return 2;
	}
	return 0;
}

if (live_enabled) 
function vm_group_jump_on_bool_or(l_th, l_act, l_scope, l_st) {
	var l_p = l_act.h_p;
	if (l_st[l_st[0]]) {
		l_scope[@2/* offset */] = l_p;
		return 2;
	} else {
		var l_i = l_st[0];
		l_st[@l_i] = 0;
		l_st[@0] = (l_i - 1);
	}
	return 0;
}

if (live_enabled) 
function vm_group_jump_on_switch(l_th, l_act, l_scope, l_st) {
	var l_jt = l_act.h_jumptable;
	var l_p = l_act.h_defaultPos;
	var l_i = l_st[0];
	var l_val = l_st[l_i];
	l_st[@l_i] = 0;
	l_st[@0] = (l_i - 1);
	if (is_real(l_val)) {
		if (frac(l_val) != 0) {
			l_scope[@2/* offset */] = l_p;
			return 2;
		}
		var l_vi = int64(l_val);
		if (l_vi != l_val) {
			l_scope[@2/* offset */] = l_p;
			return 2;
		} else l_val = l_vi;
	}
	if (gml_std_haxe_boot_isJS && is_int64(l_val)) {
		var l_vr = real(l_val);
		if (l_vr == l_val && ds_map_exists(l_jt, l_vr)) {
			l_scope[@2/* offset */] = ds_map_find_value(l_jt, l_vr);
			return 2;
		}
	}
	if (ds_map_exists(l_jt, l_val)) l_scope[@2/* offset */] = ds_map_find_value(l_jt, l_val); else l_scope[@2/* offset */] = l_p;
	return 2;
}

if (live_enabled) 
function vm_group_jump_on_switch_case(l_th, l_act, l_scope, l_st) {
	var l_p = l_act.h_p;
	var l_i = l_st[0];
	var l_r = l_st[l_i];
	l_st[@l_i] = 0;
	l_st[@0] = (l_i - 1);
	if (l_st[l_st[0]] == l_r) {
		gml_stack_discard(l_st);
		l_scope[@2/* offset */] = l_p;
		return 2;
	}
	return 0;
}

if (live_enabled) 
function vm_group_jump_on_null_co(l_th, l_act, l_scope, l_st) {
	var l_p = l_act.h_p;
	var l_val = l_st[l_st[0]];
	if (l_val != undefined && l_val != pointer_null) {
		l_scope[@2/* offset */] = l_p;
		return 2;
	} else gml_stack_discard(l_st);
	return 0;
}

if (live_enabled) 
function vm_group_jump_on_repeat_pre(l_th, l_act, l_scope, l_st) {
	var l_p = l_act.h_p;
	var l_val = l_st[l_st[0]];
	if (is_numeric(l_val)) {
		if (l_val < 1) {
			l_scope[@2/* offset */] = l_p;
			var l_i = l_st[0];
			l_st[@l_i] = 0;
			l_st[@0] = (l_i - 1);
			return 2;
		}
	} else return l_th.h_proc_error2("Repeat `times` must be a number", l_act);
	return 0;
}

if (live_enabled) 
function vm_group_jump_on_repeat_jump(l_th, l_act, l_scope, l_st) {
	var l_p = l_act.h_p;
	var l_f = l_st[l_st[0]] - 1;
	l_st[@l_st[0]] = l_f;
	if (l_f >= 1) {
		l_scope[@2/* offset */] = l_p;
		return 2;
	}
	return 0;
}

if (live_enabled) 
function vm_group_jump_on_break(l_th, l_act, l_scope, l_st) {
	l_scope[@2/* offset */] = l_act.h_lp;
	return 2;
}

if (live_enabled) 
function vm_group_jump_on_continue(l_th, l_act, l_scope, l_st) {
	l_scope[@2/* offset */] = l_act.h_lp;
	return 2;
}

if (live_enabled) 
function vm_group_jump_on_return(l_th, l_act, l_scope, l_st) {
	var l_i = l_st[0];
	var l_r = l_st[l_i];
	l_st[@l_i] = 0;
	l_st[@0] = (l_i - 1);
	l_th.h_result = l_r;
	l_scope[@2/* offset */] = ds_list_size(l_scope[1/* actions */]);
	return 2;
}

if (live_enabled) 
function vm_group_jump_on_return_const(l_th, l_act, l_scope, l_st) {
	l_th.h_result = l_act.h_val;
	l_scope[@2/* offset */] = ds_list_size(l_scope[1/* actions */]);
	return 2;
}

#endregion

#region vm_group_literal

if (live_enabled) 
function vm_group_literal_on_undefined(l_th, l_act, l_scope, l_st) {
	var l_i = l_st[0] + 1;
	if (l_i >= array_length(l_st)) l_st[@array_length(l_st) * 2] = 0;
	l_st[@l_i] = undefined;
	l_st[@0] = l_i;
	return 0;
}

if (live_enabled) 
function vm_group_literal_on_number(l_th, l_act, l_scope, l_st) {
	var l_i = l_st[0] + 1;
	if (l_i >= array_length(l_st)) l_st[@array_length(l_st) * 2] = 0;
	l_st[@l_i] = l_act.h_f;
	l_st[@0] = l_i;
	return 0;
}

if (live_enabled) 
function vm_group_literal_on_cstring(l_th, l_act, l_scope, l_st) {
	var l_i = l_st[0] + 1;
	if (l_i >= array_length(l_st)) l_st[@array_length(l_st) * 2] = 0;
	l_st[@l_i] = l_act.h_s;
	l_st[@0] = l_i;
	return 0;
}

if (live_enabled) 
function vm_group_literal_on_const(l_th, l_act, l_scope, l_st) {
	var l_i = l_st[0] + 1;
	if (l_i >= array_length(l_st)) l_st[@array_length(l_st) * 2] = 0;
	l_st[@l_i] = l_act.h_v;
	l_st[@0] = l_i;
	return 0;
}

if (live_enabled) 
function vm_group_literal_on_self(l_th, l_act, l_scope, l_st) {
	var l_inst = l_scope[6/* inst */];
	var l_i = l_st[0] + 1;
	if (l_i >= array_length(l_st)) l_st[@array_length(l_st) * 2] = 0;
	l_st[@l_i] = l_inst[l_inst[0]];
	l_st[@0] = l_i;
	return 0;
}

if (live_enabled) 
function vm_group_literal_on_other(l_th, l_act, l_scope, l_st) {
	var l_inst = l_scope[6/* inst */];
	var l_i = l_st[0] + 1;
	if (l_i >= array_length(l_st)) l_st[@array_length(l_st) * 2] = 0;
	l_st[@l_i] = l_inst[l_inst[0] - 1];
	l_st[@0] = l_i;
	return 0;
}

if (live_enabled) 
function vm_group_literal_on_result(l_th, l_act, l_scope, l_st) {
	var l_i = l_st[0] + 1;
	if (l_i >= array_length(l_st)) l_st[@array_length(l_st) * 2] = 0;
	l_st[@l_i] = l_th.h_result;
	l_st[@0] = l_i;
	return 0;
}

if (live_enabled) 
function vm_group_literal_on_array_decl(l_th, l_act, l_scope, l_st) {
	var l_n = l_act.h_size;
	var l_arr = [];
	var l_k = l_st[0] - l_n;
	array_copy(l_arr, 0, l_st, l_k + 1, l_n);
	array_copy(l_st, l_k + 1, gml_stack_fill_value_arr, 0, l_n);
	l_st[@0] = l_k;
	var l_i = l_st[0] + 1;
	if (l_i >= array_length(l_st)) l_st[@array_length(l_st) * 2] = 0;
	l_st[@l_i] = l_arr;
	l_st[@0] = l_i;
	return 0;
}

if (live_enabled) 
function vm_group_literal_on_object_decl(l_th, l_act, l_scope, l_stack) {
	var l_fields = l_act.h_fields;
	var l_obj = { }
	var l_n = array_length(l_fields);
	var l_stackStart = l_stack[0] - l_n + 1;
	var l_i = l_n;
	while (--l_i >= 0) {
		var l_fd = l_fields[l_i];
		var l_val = l_stack[l_stackStart + l_i];
		if (l_fd.bindFunc) l_val = live_method(l_obj, l_val);
		l_obj[$ l_fd.name] = l_val;
	}
	gml_stack_discard_multi(l_stack, l_n);
	var l_i = l_stack[0] + 1;
	if (l_i >= array_length(l_stack)) l_stack[@array_length(l_stack) * 2] = 0;
	l_stack[@l_i] = l_obj;
	l_stack[@0] = l_i;
	return 0;
}

#endregion

#region vm_group_local

if (live_enabled) 
function vm_group_local_on_local(l_th, l_act, l_scope, l_st) {
	var l_i1 = l_st[0] + 1;
	if (l_i1 >= array_length(l_st)) l_st[@array_length(l_st) * 2] = 0;
	l_st[@l_i1] = l_scope[4/* locals */][l_act.h_i];
	l_st[@0] = l_i1;
	return 0;
}

if (live_enabled) 
function vm_group_local_on_local_set(l_th, l_act, l_scope, l_st) {
	var l_i1 = l_st[0];
	var l_r = l_st[l_i1];
	l_st[@l_i1] = 0;
	l_st[@0] = (l_i1 - 1);
	l_scope[4/* locals */][@l_act.h_i] = l_r;
	return 0;
}

if (live_enabled) 
function vm_group_local_on_local_aop(l_th, l_act, l_scope, l_st) {
	var l_op = l_act.h_o;
	var l_i = l_act.h_i;
	var l_locals = l_scope[4/* locals */];
	var l_i1 = l_st[0];
	var l_r = l_st[l_i1];
	l_st[@l_i1] = 0;
	l_st[@0] = (l_i1 - 1);
	l_locals[@l_i] = vm_group_op_funcs[l_op](l_locals[l_i], l_r);
	return 0;
}

#endregion

#region vm_group_op

if (live_enabled) 
function vm_group_op_impl_unknown(l_a, l_b) {
	show_error("No idea how to apply this operator", true);
}

if (live_enabled) 
function vm_group_op_impl_add(l_a, l_b) {
	return l_a + l_b;
}

if (live_enabled) 
function vm_group_op_impl_sub(l_a, l_b) {
	return l_a - l_b;
}

if (live_enabled) 
function vm_group_op_impl_mul(l_a, l_b) {
	return l_a * l_b;
}

if (live_enabled) 
function vm_group_op_impl_div1(l_a, l_b) {
	if (l_b == 0 && is_int64(l_b) && is_int64(l_a)) gml_thread_error("Division by zero");
	return l_a / l_b;
}

if (live_enabled) 
function vm_group_op_impl_mod(l_a, l_b) {
	return l_a % l_b;
}

if (live_enabled) 
function vm_group_op_impl_idiv(l_a, l_b) {
	return (l_a div l_b);
}

if (live_enabled) 
function vm_group_op_impl_and(l_a, l_b) {
	return (l_a & l_b);
}

if (live_enabled) 
function vm_group_op_impl_or(l_a, l_b) {
	return (l_a | l_b);
}

if (live_enabled) 
function vm_group_op_impl_xor(l_a, l_b) {
	return (l_a ^ l_b);
}

if (live_enabled) 
function vm_group_op_impl_shl(l_a, l_b) {
	return (l_a << l_b);
}

if (live_enabled) 
function vm_group_op_impl_shr(l_a, l_b) {
	return (l_a >> l_b);
}

if (live_enabled) 
function vm_group_op_impl_eq(l_a, l_b) {
	return l_a == l_b;
}

if (live_enabled) 
function vm_group_op_impl_ne(l_a, l_b) {
	return l_a != l_b;
}

if (live_enabled) 
function vm_group_op_impl_gt(l_a, l_b) {
	return l_a > l_b;
}

if (live_enabled) 
function vm_group_op_impl_ge(l_a, l_b) {
	return l_a >= l_b;
}

if (live_enabled) 
function vm_group_op_impl_lt(l_a, l_b) {
	return l_a < l_b;
}

if (live_enabled) 
function vm_group_op_impl_le(l_a, l_b) {
	return l_a <= l_b;
}

if (live_enabled) 
function vm_group_op_impl() {
	var l_num = 112;
	var l_fns = array_create(l_num, undefined);
	var l_i = 0;
	for (var l__g1 = l_num; l_i < l__g1; l_i++) {
		l_fns[@l_i] = vm_group_op_impl_unknown;
	}
	l_fns[@16] = vm_group_op_impl_add;
	l_fns[@17] = vm_group_op_impl_sub;
	l_fns[@0] = vm_group_op_impl_mul;
	l_fns[@1] = vm_group_op_impl_div1;
	l_fns[@2] = vm_group_op_impl_mod;
	l_fns[@3] = vm_group_op_impl_idiv;
	l_fns[@49] = vm_group_op_impl_and;
	l_fns[@48] = vm_group_op_impl_or;
	l_fns[@50] = vm_group_op_impl_xor;
	l_fns[@32] = vm_group_op_impl_shl;
	l_fns[@33] = vm_group_op_impl_shr;
	l_fns[@64] = vm_group_op_impl_eq;
	l_fns[@65] = vm_group_op_impl_ne;
	l_fns[@68] = vm_group_op_impl_gt;
	l_fns[@69] = vm_group_op_impl_ge;
	l_fns[@66] = vm_group_op_impl_lt;
	l_fns[@67] = vm_group_op_impl_le;
	return l_fns;
}

if (live_enabled) 
function vm_group_op_on_bin_op(l_th, l_act, l_scope, l_st) {
	var l_z = l_st[0] - 1;
	l_st[@0] = l_z;
	l_st[@l_z] = vm_group_op_funcs[l_act.h_o](l_st[l_z], l_st[l_z + 1]);
	l_st[@l_z + 1] = 0;
	return 0;
}

if (live_enabled) 
function vm_group_op_on_un_op(l_th, l_act, l_scope, l_st) {
	var l_z = l_st[0];
	switch (l_act.h_o) {
		case 2: l_st[@l_z] = ~l_st[l_z]; break;
		case 1: l_st[@l_z] = !l_st[l_z]; break;
		case 0: l_st[@l_z] = -l_st[l_z]; break;
	}
	return 0;
}

if (live_enabled) 
function vm_group_op_on_equ_op(l_th, l_act, l_scope, l_st) {
	var l_z = l_st[0] - 1;
	l_st[@0] = l_z;
	l_st[@l_z] = l_st[l_z] == l_st[l_z + 1];
	l_st[@l_z + 1] = 0;
	return 0;
}

if (live_enabled) 
function vm_group_op_on_neq_op(l_th, l_act, l_scope, l_st) {
	var l_z = l_st[0] - 1;
	l_st[@0] = l_z;
	l_st[@l_z] = l_st[l_z] != l_st[l_z + 1];
	l_st[@l_z + 1] = 0;
	return 0;
}

if (live_enabled) 
function vm_group_op_on_add_int(l_th, l_act, l_scope, l_st) {
	var l_z = l_st[0];
	l_st[@l_z] = l_st[l_z] + l_act.h_i;
	return 0;
}

if (live_enabled) 
function vm_group_op_on_concat(l_th, l_act, l_scope, l_st) {
	var l_z = l_st[0] - 1;
	l_st[@0] = l_z;
	var l_v2 = l_st[l_z + 1];
	if (!is_string(l_v2)) l_v2 = gml_value_print(l_v2);
	var l_v1 = l_st[l_z];
	if (!is_string(l_v1)) l_v1 = gml_value_print(l_v1);
	l_st[@l_z] = l_v1 + l_v2;
	l_st[@l_z + 1] = 0;
	return 0;
}

if (live_enabled) 
function vm_group_op_on_ds_aop(l_th, l_act, l_scope, l_st) {
	var l__o = l_act.h_o;
	var l_setterArgc = l_act.h_argc;
	var l_getterFunc = l_act.h_get;
	var l_setterFunc = l_act.h_set;
	var l_k = 1 + l_st[0] - l_setterArgc;
	var l_getterArgc = l_setterArgc - 1;
	var l_arr = l_st;
	var l_v = (l_getterArgc < 81 ? vm_gml_thread_exec_slice_funcs[l_getterArgc](l_getterFunc, l_arr, l_k) : vm_gml_thread_exec_slice_longcall(l_getterFunc, l_arr, l_k, l_getterArgc));
	l_v = vm_group_op_funcs[l__o](l_v, l_st[l_k + l_getterArgc]);
	l_st[@l_k + l_getterArgc] = l_v;
	var l_arr = l_st;
	if (l_setterArgc < 81) vm_gml_thread_exec_slice_funcs[l_setterArgc](l_setterFunc, l_arr, l_k); else vm_gml_thread_exec_slice_longcall(l_setterFunc, l_arr, l_k, l_setterArgc);
	if (l_act.h_out) {
		gml_stack_pop_multi(l_st, l_getterArgc);
		l_st[@l_st[0]] = l_v;
	} else gml_stack_pop_multi(l_st, l_setterArgc);
	return 0;
}

#endregion

#region vm_group_special

if (live_enabled) 
function vm_group_special_on_wait(l_th, l_act, l_scope, l_st) {
	var l_t = gml_stack_pop(l_st);
	l_th.h_status = 5;
	l_th.h_wait_time = (is_numeric(l_t) ? l_t : 0);
	ds_list_add(l_scope[9/* program */].h_wait_list, l_th);
	return 1;
	return 0;
}

if (live_enabled) 
function vm_group_special_on_fork(l_th, l_act, l_scope, l_st) {
	var l_out = l_act.h_out;
	if (l_out) gml_stack_push(l_st, 1);
	l_th.h_fork().h_exec();
	if (l_out) l_st[@l_st[0]] = 0;
	return 2;
}

if (live_enabled) 
function vm_group_special_on_try(l_th, l_act, l_scope, l_st) {
	l_scope[@8/* xhdl */] = new gml_link(l_act.h_hdl, l_scope[8/* xhdl */]);
	return 0;
}

if (live_enabled) 
function vm_group_special_on_catch(l_th, l_act, l_scope, l_st) {
	l_scope[@8/* xhdl */] = l_scope[8/* xhdl */].h_next;
	l_scope[4/* locals */][@l_act.h_v] = l_th.h_error_text;
	l_th.h_error_text = undefined;
	return 0;
}

if (live_enabled) 
function vm_group_special_on_finally(l_th, l_act, l_scope, l_st) {
	l_scope[@8/* xhdl */] = l_scope[8/* xhdl */].h_next;
	l_scope[@2/* offset */] = l_act.h_p;
	return 2;
}

if (live_enabled) 
function vm_group_special_on_throw(l_th, l_act, l_scope, l_st) {
	return l_th.h_proc_error2(gml_std_Std_stringify(gml_stack_pop(l_st)), l_act);
	return 0;
}

#endregion

#region vm_group_stack

if (live_enabled) 
function vm_group_stack_on_discard(l_th, l_act, l_scope, l_st) {
	var l_i = l_st[0];
	l_st[@l_i] = 0;
	l_st[@0] = (l_i - 1);
	return 0;
}

if (live_enabled) 
function vm_group_stack_on_dup(l_th, l_act, l_scope, l_st) {
	var l_i = l_st[0] + 1;
	if (l_i >= array_length(l_st)) l_st[@array_length(l_st) * 2] = 0;
	l_st[@l_i] = l_st[l_i - 1];
	l_st[@0] = l_i;
	return 0;
}

if (live_enabled) 
function vm_group_stack_on_dup2x(l_th, l_act, l_scope, l_st) {
	var l_i = l_st[0] + 2;
	if (l_i >= array_length(l_st)) l_st[@array_length(l_st) * 2] = 0;
	l_st[@l_i - 1] = l_st[l_i - 3];
	l_st[@l_i] = l_st[l_i - 2];
	l_st[@0] = l_i;
	return 0;
}

if (live_enabled) 
function vm_group_stack_on_dup3x(l_th, l_act, l_scope, l_st) {
	var l_i = l_st[0] + 3;
	if (l_i >= array_length(l_st)) l_st[@array_length(l_st) * 2] = 0;
	l_st[@l_i - 2] = l_st[l_i - 5];
	l_st[@l_i - 1] = l_st[l_i - 4];
	l_st[@l_i] = l_st[l_i - 3];
	l_st[@0] = l_i;
	return 0;
}

if (live_enabled) 
function vm_group_stack_on_dup_in(l_th, l_act, l_scope, l_st) {
	var l_i = l_st[0];
	var l_v = l_st[l_i++];
	l_st[@0] = l_i;
	var l_k = l_i - l_act.h_z;
	if (l_i >= array_length(l_st)) l_st[@array_length(l_st) * 2] = 0;
	while (--l_i >= l_k) {
		l_st[@l_i + 1] = l_st[l_i];
	}
	l_st[@l_k] = l_v;
	return 0;
}

#endregion

#region vm_group_with

if (live_enabled) 
function vm_group_with_on_with_pre(l_th, l_act, l_scope, l_st) {
	var l_i = l_st[0];
	var l_val = l_st[l_i];
	l_st[@l_i] = 0;
	l_st[@0] = (l_i - 1);
	var l_ctx = l_val;
	var l_arr, l_i, l_n;
	if (is_numeric(l_val)) {
		if (l_ctx >= 100000) {
			if (instance_exists(l_ctx)) {
				l_arr = vm__gml_with_data_gml_with_data_impl__alloc(1);
				l_arr[@0] = l_ctx;
				if (!gml_std_haxe_enum_tools_getParameter(l_act, 0).h_src.h_version.h_int_self) with (l_ctx) {
					l_arr[@0] = self;
					break;
				}
				l_n = 1;
			} else {
				l_arr = vm__gml_with_data_gml_with_data_impl__alloc(0);
				l_n = 0;
			}
			l_scope[@7/* with */] = new gml_with_scope({ length: l_n, items: l_arr, refc: 1 }, l_scope[7/* with */]);
		} else {
			l_n = instance_number(l_ctx);
			l_arr = vm__gml_with_data_gml_with_data_impl__alloc(l_n);
			l_i = 0;
			with (l_ctx) {
				l_arr[@l_i] = self;
				l_i++;
			}
			l_scope[@7/* with */] = new gml_with_scope({ length: l_i, items: l_arr, refc: 1 }, l_scope[7/* with */]);
		}
	} else {
		l_arr = vm__gml_with_data_gml_with_data_impl__alloc(1);
		l_i = 0;
		with (l_ctx) {
			l_arr[@l_i] = self;
			l_i++;
		}
		l_scope[@7/* with */] = new gml_with_scope({ length: l_i, items: l_arr, refc: 1 }, l_scope[7/* with */]);
	}
	var l_inst = l_scope[6/* inst */];
	var l_i = l_inst[0] + 1;
	if (l_i >= array_length(l_inst)) l_inst[@array_length(l_inst) * 2] = 0;
	l_inst[@l_i] = undefined;
	l_inst[@0] = l_i;
	return 0;
}

if (live_enabled) 
function vm_group_with_on_with_next(l_th, l_act, l_scope, l_st) {
	var l_p = l_act.h_p;
	var l_with1 = l_scope[7/* with */];
	if (l_with1.h_index < l_with1.h_length) {
		var l_inst = l_scope[6/* inst */];
		l_inst[@l_inst[0]] = l_with1.h_array[l_with1.h_index++];
	} else {
		l_scope[@2/* offset */] = l_p;
		return 2;
	}
	return 0;
}

if (live_enabled) 
function vm_group_with_on_with_post(l_th, l_act, l_scope, l_st) {
	var l_with1 = l_scope[7/* with */];
	if (l_with1 != undefined) {
		var l_this1 = l_with1.h_data;
		if (--l_this1.refc == 0) {
			var l_size = l_this1.length;
			var l_sln = (l_size > 0 ? (log10(l_size) | 0) : 0);
			if (l_sln < 5) ds_stack_push(vm__gml_with_data_gml_with_data_impl__pools[l_sln], l_this1.items);
		}
		l_scope[@7/* with */] = l_with1.h_next;
		var l_this1 = l_scope[6/* inst */];
		var l_i = l_this1[0];
		l_this1[@l_i] = 0;
		l_this1[@0] = (l_i - 1);
	}
	return 0;
}

#endregion
