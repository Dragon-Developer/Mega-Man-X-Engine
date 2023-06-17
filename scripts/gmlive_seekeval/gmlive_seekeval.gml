// GMLive.gml (c) YellowAfterlife, 2017+
// PLEASE DO NOT FORGET to remove paid extensions from your project when publishing the source code!
// And if you are using git, you can exclude GMLive by adding
// `scripts/GMLive*` and `extensions/GMLive/` lines to your `.gitignore`.
// Feather disable all

#region gml.seek_eval

if (live_enabled) 
function gml_seek_eval_node_to_value(l_node) {
	var l__g = l_node;
	switch (l__g.__enumIndex__/* gml_node */) {
		case 0/* undefined_hx */: return undefined;
		case 2/* number */: return l__g.h_value;
		case 3/* cstring */: return l__g.h_value;
		case 19/* const */: return gml_const_val.h_obj[$ l__g.h_name];
		case 5/* enum_ctr */: return l__g.h_ctr.h_value;
		case 18/* native_script */: return l__g.h_id;
		default: return gml_seek_eval_invalid_value;
	}
}

if (live_enabled) 
function gml_seek_eval_value_to_node(l_val, l_d) {
	if (is_bool(l_val)) return gml_node_boolean(l_d, l_val);
	if (is_numeric(l_val)) return gml_node_number(l_d, l_val, undefined);
	if (is_string(l_val)) return gml_node_cstring(l_d, l_val);
	if (l_val == undefined) return gml_node_undefined_hx(l_d);
	if (is_ptr(l_val)) return gml_node_other_const(l_d, l_val);
	return undefined;
}

if (live_enabled) 
function gml_seek_eval_proc(l_q, l_st) {
	var l_f1, l_f2;
	var l_z = true;
	var l_v1, l_v2, l_i, l_n;
	var l__g = l_q;
	switch (l__g.__enumIndex__/* gml_node */) {
		case 0/* undefined_hx */: break;
		case 2/* number */: break;
		case 3/* cstring */: break;
		case 19/* const */: break;
		case 36/* bin_op */:
			var l__g2 = l__g.h_op;
			if (l__g2 == 16) {
				var l_d = l__g.h_d;
				var l_a = l__g.h_a;
				var l_b = l__g.h_b;
				if (gml_seek_eval_proc(l_a, l_st)) l_z = false;
				if (gml_seek_eval_proc(l_b, l_st)) l_z = false;
				if (l_z) {
					l_v1 = gml_seek_eval_node_to_value(l_a);
					l_v2 = gml_seek_eval_node_to_value(l_b);
					if (is_string(l_v1)) {
						if (is_string(l_v2)) {
							gml_std_haxe_enum_tools_setTo(l_q, gml_node_cstring(l_d, l_v1 + l_v2));
						} else {
							var l__g = l_b;
							if (l__g.__enumIndex__/* gml_node */ == 36/* bin_op */) {
								if (l__g.h_op == 16) {
									var l__hx_tmp = l__g.h_a;
									if (l__hx_tmp.__enumIndex__/* gml_node */ == 3/* cstring */) {
										gml_std_haxe_enum_tools_setTo(l_q, gml_node_bin_op(l_d, 16, gml_node_cstring(l_d, l_v1 + l__hx_tmp.h_value), l__g.h_b));
									} else {
										gml_seek_eval_error_text = "Can't add " + gml_std_Type_enumConstructor(l_a) + " and " + gml_std_Type_enumConstructor(l_b) + " at compile time";
										gml_seek_eval_error_pos = gml_std_haxe_enum_tools_getParameter(l_q, 0);
										l_z = false;
									}
								} else {
									gml_seek_eval_error_text = "Can't add " + gml_std_Type_enumConstructor(l_a) + " and " + gml_std_Type_enumConstructor(l_b) + " at compile time";
									gml_seek_eval_error_pos = gml_std_haxe_enum_tools_getParameter(l_q, 0);
									l_z = false;
								}
							} else {
								gml_seek_eval_error_text = "Can't add " + gml_std_Type_enumConstructor(l_a) + " and " + gml_std_Type_enumConstructor(l_b) + " at compile time";
								gml_seek_eval_error_pos = gml_std_haxe_enum_tools_getParameter(l_q, 0);
								l_z = false;
							}
						}
					} else if (is_numeric(l_v1)) {
						if (is_numeric(l_v2)) {
							gml_std_haxe_enum_tools_setTo(l_q, gml_node_number(l_d, l_v1 + l_v2, undefined));
						} else {
							gml_seek_eval_error_text = "Can't add " + gml_std_Type_enumConstructor(l_a) + " and " + gml_std_Type_enumConstructor(l_b) + " at compile time";
							gml_seek_eval_error_pos = gml_std_haxe_enum_tools_getParameter(l_q, 0);
							l_z = false;
						}
					} else if (is_string(l_v2)) {
						var l__g = l_a;
						if (l__g.__enumIndex__/* gml_node */ == 36/* bin_op */) {
							if (l__g.h_op == 16) {
								var l__hx_tmp = l__g.h_b;
								if (l__hx_tmp.__enumIndex__/* gml_node */ == 3/* cstring */) {
									gml_std_haxe_enum_tools_setTo(l_q, gml_node_bin_op(l_d, 16, l__g.h_a, gml_node_cstring(l_d, l__hx_tmp.h_value + l_v2)));
								} else {
									gml_seek_eval_error_text = "Can't add " + gml_std_Type_enumConstructor(l_a) + " and " + gml_std_Type_enumConstructor(l_b) + " at compile time";
									gml_seek_eval_error_pos = gml_std_haxe_enum_tools_getParameter(l_q, 0);
									l_z = false;
								}
							} else {
								gml_seek_eval_error_text = "Can't add " + gml_std_Type_enumConstructor(l_a) + " and " + gml_std_Type_enumConstructor(l_b) + " at compile time";
								gml_seek_eval_error_pos = gml_std_haxe_enum_tools_getParameter(l_q, 0);
								l_z = false;
							}
						} else {
							gml_seek_eval_error_text = "Can't add " + gml_std_Type_enumConstructor(l_a) + " and " + gml_std_Type_enumConstructor(l_b) + " at compile time";
							gml_seek_eval_error_pos = gml_std_haxe_enum_tools_getParameter(l_q, 0);
							l_z = false;
						}
					} else {
						gml_seek_eval_error_text = "Can't add " + gml_std_Type_enumConstructor(l_a) + " and " + gml_std_Type_enumConstructor(l_b) + " at compile time";
						gml_seek_eval_error_pos = gml_std_haxe_enum_tools_getParameter(l_q, 0);
						l_z = false;
					}
				}
			} else {
				var l_o = l__g2;
				var l_d = l__g.h_d;
				var l_a1 = l__g.h_a;
				var l_b1 = l__g.h_b;
				if (gml_seek_eval_proc(l_a1, l_st)) l_z = false;
				if (gml_seek_eval_proc(l_b1, l_st)) l_z = false;
				if (l_z) {
					l_v1 = gml_seek_eval_node_to_value(l_a1);
					l_v2 = gml_seek_eval_node_to_value(l_b1);
					if (is_numeric(l_v1) && is_numeric(l_v2)) {
						l_f1 = l_v1;
						l_f2 = l_v2;
						switch (l_o) {
							case 16: l_f1 += l_f2; break;
							case 17: l_f1 -= l_f2; break;
							case 0: l_f1 *= l_f2; break;
							case 1: l_f1 /= l_f2; break;
							case 2: l_f1 %= l_f2; break;
							case 3:
								if (l_f2 == 0 && is_int64(l_f2) && is_int64(l_f1)) show_error("Division by zero", true);
								l_f1 /= l_f2;
								break;
							case 49: l_f1 = (l_f1 & l_f2); break;
							case 48: l_f1 = (l_f1 | l_f2); break;
							case 50: l_f1 = (l_f1 ^ l_f2); break;
							case 32: l_f1 = (l_f1 << l_f2); break;
							case 33: l_f1 = (l_f1 >> l_f2); break;
							case 64: l_f1 = l_f1 == l_f2; break;
							case 65: l_f1 = l_f1 != l_f2; break;
							case 67: l_f1 = l_f1 <= l_f2; break;
							case 69: l_f1 = l_f1 >= l_f2; break;
							case 66: l_f1 = l_f1 < l_f2; break;
							case 68: l_f1 = l_f1 > l_f2; break;
							case 80: l_f1 = l_f1 && l_f2; break;
							case 96: l_f1 = l_f1 || l_f2; break;
							default:
								gml_seek_eval_error_text = "Can't apply " + gml_op_get_name(l_o);
								gml_seek_eval_error_pos = gml_std_haxe_enum_tools_getParameter(l_q, 0);
								l_z = false;
						}
						if (l_z) gml_std_haxe_enum_tools_setTo(l_q, gml_node_number(l_d, l_f1, undefined));
					} else {
						gml_seek_eval_error_text = "Can't apply " + gml_op_get_name(l_o) + " to " + gml_std_Type_enumConstructor(l_a1) + " and " + gml_std_Type_enumConstructor(l_b1);
						gml_seek_eval_error_pos = gml_std_haxe_enum_tools_getParameter(l_q, 0);
						l_z = false;
					}
				}
			}
			break;
		case 29/* call_func */:
			var l_fn = l__g.h_func;
			var l_args1 = l__g.h_args;
			l_n = array_length(l_args1);
			for (l_i = 0; l_i < l_n; l_i++) {
				if (gml_seek_eval_proc(l_args1[l_i], l_st)) l_z = false;
			}
			if (l_z && l_fn.h_is_const) {
				var l_evalArgs = array_create(l_n);
				var l_val;
				l_i = 0;
				while (l_i < l_n) {
					l_val = gml_seek_eval_node_to_value(l_args1[l_i]);
					if (l_val != gml_seek_eval_invalid_value) {
						l_evalArgs[@l_i] = l_val;
						l_i++;
					} else break;
				}
				if (l_i >= l_n) {
					var l_th = gml_seek_eval_eval_thread;
					if (l_th == undefined) {
						l_th = new gml_thread(gml_program_seek_inst, gml_seek_eval_eval_actions, array_create(0), array_create(0), undefined, undefined, 0);
						gml_seek_eval_eval_thread = l_th;
					}
					var l_th0 = gml_thread_current;
					gml_thread_current = l_th;
					l_th.h_status = 1;
					var l_fn1 = l_fn.h_func;
					l_val = (l_n < 81 ? vm_gml_thread_exec_slice_funcs[l_n](l_fn1, l_evalArgs, 0) : vm_gml_thread_exec_slice_longcall(l_fn1, l_evalArgs, 0, l_n));
					gml_thread_current = l_th0;
					if (l_th.h_status != 4) {
						var l_next = gml_seek_eval_value_to_node(l_val, gml_std_haxe_enum_tools_getParameter(l_q, 0));
						if (l_next != undefined) {
							gml_std_haxe_enum_tools_setTo(l_q, l_next);
						} else {
							gml_seek_eval_error_text = "Could not translate " + gml_value_print(l_val) + " (" + gml_value_get_type(l_val) + ") compile-time";
							gml_seek_eval_error_pos = gml_std_haxe_enum_tools_getParameter(l_q, 0);
						}
					} else {
						gml_seek_eval_error_text = "Could not evaluate compile-time: " + l_th.h_error_text;
						gml_seek_eval_error_pos = gml_std_haxe_enum_tools_getParameter(l_q, 0);
					}
				}
			}
			break;
		default:
			if (gml_seek_eval_eval_rec) {
				if (gml_node_tools_seek(l_q, l_st, gml_seek_eval_proc)) l_z = false;
			} else {
				gml_seek_eval_error_text = gml_std_Type_enumConstructor(l_q) + " doesn't seem to be a constant expression.";
				gml_seek_eval_error_pos = gml_std_haxe_enum_tools_getParameter(l_q, 0);
				l_z = false;
			}
	}
	return !l_z;
}

if (live_enabled) 
function gml_seek_eval_eval(l_q) {
	gml_seek_eval_eval_rec = false;
	var l_r = gml_seek_eval_proc(l_q, undefined);
	gml_seek_eval_eval_thread = undefined;
	return l_r;
}

if (live_enabled) 
function gml_seek_eval_opt() {
	gml_seek_eval_eval_rec = true;
	gml_program_seek_inst.h_seek(gml_seek_eval_proc);
	gml_seek_eval_eval_thread = undefined;
	return false;
}

#endregion
