// GMLive.gml (c) YellowAfterlife, 2017+
// PLEASE DO NOT FORGET to remove paid extensions from your project when publishing the source code!
// And if you are using git, you can exclude GMLive by adding
// `scripts/GMLive*` and `extensions/GMLive/` lines to your `.gitignore`.
// Feather disable all

// Helpers for AST nodes
#region gml.node_tools

if (live_enabled) 
function gml_node_tools_unpack(l_q) {
	while (l_q != undefined) {
		var l__g = l_q;
		if (l__g.__enumIndex__/* gml_node */ == 93/* block */) {
			var l__g2 = l__g.h_nodes;
			if (array_length(l__g2) == 1) l_q = l__g2[0]; else return l_q;
		} else return l_q;
	}
	return l_q;
}

if (live_enabled) 
function gml_node_tools_is_statement(l_q) {
	switch (l_q.__enumIndex__/* gml_node */) {
		case 23/* call */: return true;
		case 37/* set_op */: return true;
		case 92/* var_decl */: return true;
		case 33/* prefix */: return true;
		case 34/* postfix */: return true;
		case 93/* block */: return true;
		case 94/* if_then */: return true;
		case 96/* switch_hx */: return true;
		case 103/* for_hx */: return true;
		case 99/* while_hx */: return true;
		case 102/* repeat_hx */: return true;
		case 101/* do_while */: return true;
		case 100/* do_until */: return true;
		case 104/* with_hx */: return true;
		case 108/* break_hx */: return true;
		case 109/* continue_hx */: return true;
		case 107/* exit_hx */: return true;
		case 106/* return_hx */: return true;
		case 97/* wait */: return true;
		case 110/* debugger */: return true;
		case 111/* try_catch */: return true;
		case 112/* throw_hx */: return true;
		default: return false;
	}
}

if (live_enabled) 
function gml_node_tools_is_in_block(l_q, l_p) {
	if (l_p == undefined || l_q == undefined) return false;
	var l__g = l_p;
	switch (l__g.__enumIndex__/* gml_node */) {
		case 93/* block */: return true;
		case 94/* if_then */: if (l_q != l__g.h_then) return l_q == l__g.h_not; else return true;
		case 99/* while_hx */: return l_q == l__g.h_loop;
		case 101/* do_while */: return l_q == l__g.h_loop;
		case 100/* do_until */: return l_q == l__g.h_loop;
		case 102/* repeat_hx */: return l_q == l__g.h_loop;
		case 103/* for_hx */: return (l_q == l__g.h_pre || l_q == l__g.h_post) || l_q == l__g.h_loop;
		case 96/* switch_hx */:
			var l__cases = l__g.h_cases;
			if (l_q == l__g.h_def) return true;
			var l_i = 0;
			for (var l__g2 = array_length(l__cases); l_i < l__g2; l_i++) {
				if (l__cases[l_i].expr == l_q) return true;
			}
			return false;
		default: return false;
	}
}

if (live_enabled) 
function gml_node_tools_to_case_value(l_q) {
	var l__g = l_q;
	switch (l__g.__enumIndex__/* gml_node */) {
		case 2/* number */:
			var l_f = l__g.h_value;
			if (is_real(l_f) && sign(frac(l_f)) != 0) return undefined;
			if (int64(l_f) != l_f) return undefined;
			return l_f;
		case 3/* cstring */: return l__g.h_value;
		case 5/* enum_ctr */: return l__g.h_ctr.h_value;
		default: return undefined;
	}
}

if (live_enabled) 
function gml_node_tools_equals_list(l_a, l_b) {
	var l_n = array_length(l_a);
	if (array_length(l_b) != l_n) return false;
	var l_i = 0;
	while (l_i < l_n) {
		if (gml_node_tools_equals(l_a[l_i], l_b[l_i])) l_i++; else return false;
	}
	return true;
}

if (live_enabled) 
function gml_node_tools_equals_lf(l__, l_av, l_bv, l_ip) {
	var l_tmp;
	switch (l_ip.h_type) {
		case 0: l_tmp = gml_node_tools_equals(l_av, l_bv); break;
		case 13: l_tmp = l_av == l_bv; break;
		case 1: l_tmp = gml_node_tools_equals_list(l_av, l_bv); break;
		case 5: case 6: case 7: l_tmp = l_av == l_bv; break;
		case 10: case 11: case 12: l_tmp = l_av == l_bv; break;
		case 8: case 9: l_tmp = l_av == l_bv; break;
		case 14: return array_equals(l_av, l_bv);
		case 4:
			var l_cca = l_av;
			var l_ccb = l_bv;
			var l_n = array_length(l_cca);
			var l_i = -1;
			var l_ok = l_n == array_length(l_ccb);
			if (l_ok) while (++l_i < l_n) {
				if (!gml_node_tools_equals(l_cca[l_i].expr, l_ccb[l_i].expr)) {
					l_ok = false;
					break;
				}
				if (!gml_node_tools_equals_list(l_cca[l_i].values, l_ccb[l_i].values)) {
					l_ok = false;
					break;
				}
			}
			l_tmp = l_ok;
			break;
		default: l_tmp = true;
	}
	return !l_tmp;
}

if (live_enabled) 
function gml_node_tools_equals(l_a, l_b) {
	if (l_a == undefined) return l_b == undefined;
	if (l_b == undefined) return false;
	if (l_a.__enumIndex__ != l_b.__enumIndex__) return false;
	var l_params = ast_gml_node_def_info_array[gml_std_Type_enumIndex(l_a)].h_params;
	var l_result = false;
	var l__names = l_a.__enumParams__;
	var l_i = 0;
	for (var l__g1 = array_length(l_params); l_i < l__g1; l_i++) {
		if (gml_node_tools_equals_lf(l_i, l_a[$ l__names[l_i]], l_b[$ l__names[l_i]], l_params[l_i])) {
			l_result = true;
			break;
		}
	}
	return !l_result;
}

if (live_enabled) 
function gml_node_tools_clone_list(l__arr) {
	if (l__arr == undefined) return undefined;
	var l_arr = gml_std_gml_internal_ArrayImpl_copy(l__arr);
	var l_i = array_length(l_arr);
	while (--l_i >= 0) {
		l_arr[@l_i] = gml_node_tools_clone(l_arr[l_i]);
	}
	return l_arr;
}

if (live_enabled) 
function gml_node_tools_clone_case(l_cc0) {
	return { values: gml_node_tools_clone_list(l_cc0.values), expr: gml_node_tools_clone(l_cc0.expr), pre: gml_node_tools_clone_list(l_cc0.pre) }
}

if (live_enabled) 
function gml_node_tools_clone(l_q) {
	if (l_q == undefined) return undefined;
	var l_ndef = gml_std_Type_createEnumIndex(mt_gml_node, gml_std_Type_enumIndex(l_q), gml_std_Type_enumParameters(l_q));
	var l_params = ast_gml_node_def_info_array[gml_std_Type_enumIndex(l_q)].h_params;
	var l__names = l_ndef.__enumParams__;
	var l_i = 0;
	for (var l__g1 = array_length(l_params); l_i < l__g1; l_i++) {
		var l__names1 = l__names[l_i];
		var l_v = l_ndef[$ l__names[l_i]];
		var l_tmp;
		switch (l_params[l_i].h_type) {
			case 2: l_tmp = l_v; break;
			case 8: case 9: l_tmp = l_v; break;
			case 13: l_tmp = l_v; break;
			case 14: l_tmp = gml_std_gml_internal_ArrayImpl_copy(l_v); break;
			case 1: l_tmp = gml_node_tools_clone_list(l_v); break;
			case 0: l_tmp = gml_node_tools_clone(l_v); break;
			case 5: case 6: case 7: l_tmp = l_v; break;
			case 10: case 11: case 12: l_tmp = l_v; break;
			case 3: l_tmp = gml_node_tools_clone_case(l_v); break;
			case 4:
				var l_cc = gml_std_gml_internal_ArrayImpl_copy(l_v);
				var l_i1 = array_length(l_cc);
				while (--l_i1 >= 0) {
					l_cc[@l_i1] = gml_node_tools_clone_case(l_cc[l_i1]);
				}
				l_tmp = l_cc;
				break;
		}
		l_ndef[$ l__names1] = l_tmp;
	}
	return l_ndef;
}

if (live_enabled) 
function gml_node_tools_seek_all_out(l_q, l_st, l_c, l_si) {
	var l_w, l_i;
	var l_par = ds_list_find_value(l_st, l_si);
	if (l_par == undefined) return false;
	var l__g = l_par;
	switch (l__g.__enumIndex__/* gml_node */) {
		case 93/* block */:
			l_w = l__g.h_nodes;
			l_i = array_length(l_w);
			while (--l_i >= 0) {
				if (l_w[l_i] == l_q) break;
			}
			while (--l_i >= 0) {
				if (l_c(l_w[l_i], undefined)) return true;
			}
			break;
		case 94/* if_then */:
			var l_c1 = l__g.h_cond;
			if (l_c1 != l_q && l_c(l_c1, undefined)) return true;
			break;
		case 99/* while_hx */:
			var l_c1 = l__g.h_cond;
			if (l_c1 != l_q && l_c(l_c1, undefined)) return true;
			break;
		case 101/* do_while */:
			var l_c1 = l__g.h_loop;
			if (l_c1 != l_q && l_c(l_c1, undefined)) return true;
			break;
		case 100/* do_until */:
			var l_c1 = l__g.h_loop;
			if (l_c1 != l_q && l_c(l_c1, undefined)) return true;
			break;
		case 102/* repeat_hx */:
			var l_c1 = l__g.h_times;
			if (l_c1 != l_q && l_c(l_c1, undefined)) return true;
			break;
		case 103/* for_hx */:
			var l_c1 = l__g.h_pre;
			if (l_c1 != l_q && l_c(l_c1, undefined)) return true;
			break;
		case 96/* switch_hx */:
			var l_c1 = l__g.h_expr;
			if (l_c1 != l_q && l_c(l_c1, undefined)) return true;
			break;
		case 104/* with_hx */:
			var l_c1 = l__g.h_ctx;
			if (l_c1 != l_q && l_c(l_c1, undefined)) return true;
			break;
		default: show_error("Can't seekAllOut over " + ast_gml_node_tools_ni_get_pos_string(l_par) + " " + gml_std_Type_enumConstructor(l_par), true);
	}
	return gml_node_tools_seek_all_out(l_par, l_st, l_c, l_si + 1);
}

if (live_enabled) 
function gml_node_tools_seek_arr(l_arr, l_fn, l_st) {
	var l_i = 0;
	for (var l__g1 = array_length(l_arr); l_i < l__g1; l_i++) {
		if (l_fn(l_arr[l_i], undefined)) return true;
	}
	return false;
}

if (live_enabled) 
function gml_node_tools_seek_or2(l_a, l_b, l_fn, l_st) {
	return l_fn(l_a, undefined) || l_fn(l_b, undefined);
}

if (live_enabled) 
function gml_node_tools_seek_or3(l_a, l_b, l_c, l_fn, l_st) {
	return (l_fn(l_a, undefined) || l_fn(l_b, undefined)) || l_fn(l_c, undefined);
}

if (live_enabled) 
function gml_node_tools_seek_or4(l_a, l_b, l_c, l_d, l_fn, l_st) {
	return (l_fn(l_a, undefined) || l_fn(l_b, undefined) || l_fn(l_c, undefined)) || l_fn(l_d, undefined);
}

if (live_enabled) 
function gml_node_tools_seek_1or_arr(l_a, l_arr, l_fn, l_st) {
	if (l_fn(l_a, undefined)) return true;
	var l_i = 0;
	for (var l__g1 = array_length(l_arr); l_i < l__g1; l_i++) {
		if (l_fn(l_arr[l_i], undefined)) return true;
	}
	return false;
}

if (live_enabled) 
function gml_node_tools_seek_all(l_q, l_st, l_c) {
	if (l_st != undefined) ds_list_insert(l_st, 0, l_q);
	var l_r = false;
	var l_x, l_w, l_i, l_n;
	var l_trouble = false;
	var l__g = l_q;
	switch (l__g.__enumIndex__/* gml_node */) {
		case 10/* ensure_array_for_field */: l_r = l_c(l__g.h_obj, undefined); break;
		case 21/* arg_index */: l_r = l_c(l__g.h_index, undefined); break;
		case 33/* prefix */: l_r = l_c(l__g.h_expr, undefined); break;
		case 34/* postfix */: l_r = l_c(l__g.h_expr, undefined); break;
		case 38/* delete_hx */: l_r = l_c(l__g.h_expr, undefined); break;
		case 40/* to_bool */: l_r = l_c(l__g.h_val, undefined); break;
		case 41/* from_bool */: l_r = l_c(l__g.h_val, undefined); break;
		case 44/* local_set */: l_r = l_c(l__g.h_val, undefined); break;
		case 45/* local_aop */: l_r = l_c(l__g.h_val, undefined); break;
		case 46/* static_decl */: l_r = l_c(l__g.h_val, undefined); break;
		case 48/* static_set */: l_r = l_c(l__g.h_val, undefined); break;
		case 49/* static_aop */: l_r = l_c(l__g.h_val, undefined); break;
		case 51/* global_set */: l_r = l_c(l__g.h_val, undefined); break;
		case 52/* global_aop */: l_r = l_c(l__g.h_val, undefined); break;
		case 57/* env_set */: l_r = l_c(l__g.h_val, undefined); break;
		case 58/* env_aop */: l_r = l_c(l__g.h_val, undefined); break;
		case 97/* wait */: l_r = l_c(l__g.h_time, undefined); break;
		case 105/* once */: l_r = l_c(l__g.h_loop, undefined); break;
		case 106/* return_hx */: l_r = l_c(l__g.h_val, undefined); break;
		case 112/* throw_hx */: l_r = l_c(l__g.h_err, undefined); break;
		case 0/* undefined_hx */: l_r = false; break;
		case 1/* boolean */: l_r = false; break;
		case 2/* number */: l_r = false; break;
		case 3/* cstring */: l_r = false; break;
		case 4/* other_const */: l_r = false; break;
		case 5/* enum_ctr */: l_r = false; break;
		case 8/* ensure_array_for_local */: l_r = false; break;
		case 9/* ensure_array_for_global */: l_r = false; break;
		case 13/* ident */: l_r = false; break;
		case 14/* self_hx */: l_r = false; break;
		case 15/* other_hx */: l_r = false; break;
		case 16/* global_ref */: l_r = false; break;
		case 17/* script */: l_r = false; break;
		case 18/* native_script */: l_r = false; break;
		case 19/* const */: l_r = false; break;
		case 20/* arg_const */: l_r = false; break;
		case 22/* arg_count */: l_r = false; break;
		case 32/* func_literal */: l_r = false; break;
		case 43/* local_hx */: l_r = false; break;
		case 47/* static */: l_r = false; break;
		case 50/* global_hx */: l_r = false; break;
		case 56/* env */: l_r = false; break;
		case 98/* fork */: l_r = false; break;
		case 107/* exit_hx */: l_r = false; break;
		case 108/* break_hx */: l_r = false; break;
		case 109/* continue_hx */: l_r = false; break;
		case 110/* debugger */: l_r = false; break;
		case 36/* bin_op */:
			switch (l__g.h_op) {
				case 80:
					var l_a = l__g.h_a;
					var l_b = l__g.h_b;
					l_r = l_c(l_a, undefined) && l_c(l_b, undefined);
					break;
				case 96: l_r = l_c(l__g.h_a, undefined); break;
				default: l_r = gml_node_tools_seek_or2(l__g.h_a, l__g.h_b, l_c, l_st);
			}
			break;
		case 6/* array_decl */: gml_node_tools_seek_arr(l__g.h_values, l_c, l_st); break;
		case 7/* object_decl */: gml_node_tools_seek_arr(l__g.h_values, l_c, l_st); break;
		case 92/* var_decl */:
			var l_v = l__g.h_val;
			l_r = l_v != undefined && l_c(l_v, undefined);
			break;
		case 39/* null_co */: l_r = l_c(l__g.h_a, undefined); break;
		case 35/* un_op */: l_r = l_c(l__g.h_expr, undefined); break;
		case 93/* block */: l_r = gml_node_tools_seek_arr(l__g.h_nodes, l_c, l_st); break;
		case 23/* call */: l_r = gml_node_tools_seek_1or_arr(l__g.h_expr, l__g.h_args, l_c, l_st); break;
		case 26/* call_script_id */: l_r = gml_node_tools_seek_1or_arr(l__g.h_index, l__g.h_args, l_c, l_st); break;
		case 31/* construct */: l_r = gml_node_tools_seek_1or_arr(l__g.h_ctr, l__g.h_args, l_c, l_st); break;
		case 25/* call_script_at */: l_r = gml_node_tools_seek_1or_arr(l__g.h_inst, l__g.h_args, l_c, l_st); break;
		case 28/* call_field */: l_r = gml_node_tools_seek_1or_arr(l__g.h_obj, l__g.h_args, l_c, l_st); break;
		case 30/* call_func_at */: l_r = gml_node_tools_seek_1or_arr(l__g.h_expr, l__g.h_args, l_c, l_st); break;
		case 24/* call_script */: l_r = gml_node_tools_seek_arr(l__g.h_args, l_c, l_st); break;
		case 29/* call_func */: l_r = gml_node_tools_seek_arr(l__g.h_args, l_c, l_st); break;
		case 27/* call_script_with_array */:
			var l_x1 = l__g.h_index;
			var l_y = l__g.h_array;
			l_r = l_c(l_x1, undefined) || l_c(l_y, undefined);
			break;
		case 94/* if_then */:
			var l_c1 = l__g.h_cond;
			var l_a = l__g.h_then;
			var l_b = l__g.h_not;
			l_r = l_c(l_c1, undefined) || l_b != undefined && l_c(l_a, undefined) && l_c(l_b, undefined);
			break;
		case 95/* ternary */:
			var l_c1 = l__g.h_cond;
			var l_a = l__g.h_then;
			var l_b = l__g.h_not;
			l_r = l_c(l_c1, undefined) || l_c(l_a, undefined) && l_c(l_b, undefined);
			break;
		case 103/* for_hx */: l_r = gml_node_tools_seek_or2(l__g.h_pre, l__g.h_cond, l_c, undefined); break;
		case 99/* while_hx */: l_r = l_c(l__g.h_cond, undefined); break;
		case 104/* with_hx */: l_r = l_c(l__g.h_ctx, undefined); break;
		case 101/* do_while */: l_r = l_c(l__g.h_loop, undefined); break;
		case 100/* do_until */: l_r = l_c(l__g.h_loop, undefined); break;
		case 102/* repeat_hx */: l_r = l_c(l__g.h_times, undefined); break;
		case 96/* switch_hx */:
			var l__x = l__g.h_expr;
			var l__cc = l__g.h_cases;
			var l__d = l__g.h_def;
			if (l_c(l__x, undefined)) {
				l_r = true;
			} else {
				l_x = l__d;
				if (l_x != undefined && l_c(l_x, undefined)) {
					l_n = array_length(l__cc);
					l_i = 0;
					while (l_i < l_n) {
						if (l_c(l_x, undefined)) l_i++; else break;
					}
					l_r = l_i >= l_n;
				} else l_r = false;
			}
			break;
		case 111/* try_catch */:
			var l_x = l__g.h_block;
			var l_e = l__g.h_catcher;
			l_r = l_c(l_x, undefined) || l_c(l_e, undefined);
			break;
		case 37/* set_op */: l_r = gml_node_tools_seek_or2(l__g.h_a, l__g.h_b, l_c, l_st); break;
		case 42/* in */: l_r = gml_node_tools_seek_or2(l__g.h_fd, l__g.h_obj, l_c, l_st); break;
		case 62/* env1d */: l_r = l_c(l__g.h_index, undefined); break;
		case 63/* env1d_set */: l_r = gml_node_tools_seek_or2(l__g.h_index, l__g.h_val, l_c, l_st); break;
		case 64/* env1d_aop */: l_r = gml_node_tools_seek_or2(l__g.h_index, l__g.h_val, l_c, l_st); break;
		case 65/* alarm */: l_r = gml_node_tools_seek_or2(l__g.h_obj, l__g.h_index, l_c, l_st); break;
		case 66/* alarm_set_hx */: l_r = gml_node_tools_seek_or3(l__g.h_obj, l__g.h_index, l__g.h_val, l_c, l_st); break;
		case 67/* alarm_aop */: l_r = gml_node_tools_seek_or3(l__g.h_obj, l__g.h_index, l__g.h_val, l_c, l_st); break;
		case 11/* ensure_array_for_index */: l_r = gml_node_tools_seek_or2(l__g.h_arr, l__g.h_ind, l_c, l_st); break;
		case 12/* ensure_array_for_index2d */: l_r = gml_node_tools_seek_or3(l__g.h_arr, l__g.h_ind1, l__g.h_ind2, l_c, l_st); break;
		case 68/* index */: l_r = gml_node_tools_seek_or2(l__g.h_arr, l__g.h_index, l_c, l_st); break;
		case 69/* index_set */: l_r = gml_node_tools_seek_or3(l__g.h_arr, l__g.h_index, l__g.h_val, l_c, l_st); break;
		case 70/* index_aop */: l_r = gml_node_tools_seek_or3(l__g.h_arr, l__g.h_index, l__g.h_val, l_c, l_st); break;
		case 71/* index2d */: l_r = gml_node_tools_seek_or3(l__g.h_arr, l__g.h_index1, l__g.h_index2, l_c, l_st); break;
		case 72/* index2d_set */: l_r = gml_node_tools_seek_or4(l__g.h_arr, l__g.h_index1, l__g.h_index2, l__g.h_val, l_c, l_st); break;
		case 73/* index2d_aop */: l_r = gml_node_tools_seek_or4(l__g.h_arr, l__g.h_index1, l__g.h_index2, l__g.h_val, l_c, l_st); break;
		case 74/* raw_id */: l_r = gml_node_tools_seek_or2(l__g.h_arr, l__g.h_index, l_c, l_st); break;
		case 75/* raw_id_set */: l_r = gml_node_tools_seek_or3(l__g.h_arr, l__g.h_index, l__g.h_val, l_c, l_st); break;
		case 76/* raw_id_aop */: l_r = gml_node_tools_seek_or3(l__g.h_arr, l__g.h_index, l__g.h_val, l_c, l_st); break;
		case 77/* raw_id2d */: l_r = gml_node_tools_seek_or3(l__g.h_arr, l__g.h_index1, l__g.h_index2, l_c, l_st); break;
		case 78/* raw_id2d_set */: l_r = gml_node_tools_seek_or4(l__g.h_arr, l__g.h_index1, l__g.h_index2, l__g.h_val, l_c, l_st); break;
		case 79/* raw_id2d_aop */: l_r = gml_node_tools_seek_or4(l__g.h_arr, l__g.h_index1, l__g.h_index2, l__g.h_val, l_c, l_st); break;
		case 53/* field */: l_r = l_c(l__g.h_obj, undefined); break;
		case 54/* field_set */: l_r = gml_node_tools_seek_or2(l__g.h_obj, l__g.h_val, l_c, l_st); break;
		case 55/* field_aop */: l_r = gml_node_tools_seek_or2(l__g.h_obj, l__g.h_val, l_c, l_st); break;
		case 59/* env_fd */: l_r = l_c(l__g.h_obj, undefined); break;
		case 60/* env_fd_set */: l_r = gml_node_tools_seek_or2(l__g.h_obj, l__g.h_val, l_c, l_st); break;
		case 61/* env_fd_aop */: l_r = gml_node_tools_seek_or2(l__g.h_obj, l__g.h_val, l_c, l_st); break;
		case 80/* ds_list */: l_r = gml_node_tools_seek_or2(l__g.h_list, l__g.h_index, l_c, l_st); break;
		case 81/* ds_list_set_hx */: l_r = gml_node_tools_seek_or3(l__g.h_list, l__g.h_index, l__g.h_val, l_c, l_st); break;
		case 82/* ds_list_aop */: l_r = gml_node_tools_seek_or3(l__g.h_list, l__g.h_index, l__g.h_val, l_c, l_st); break;
		case 83/* ds_map */: l_r = gml_node_tools_seek_or2(l__g.h_map, l__g.h_key, l_c, l_st); break;
		case 84/* ds_map_set_hx */: l_r = gml_node_tools_seek_or3(l__g.h_map, l__g.h_key, l__g.h_val, l_c, l_st); break;
		case 85/* ds_map_aop */: l_r = gml_node_tools_seek_or3(l__g.h_map, l__g.h_key, l__g.h_val, l_c, l_st); break;
		case 86/* ds_grid */: l_r = gml_node_tools_seek_or3(l__g.h_grid, l__g.h_index1, l__g.h_index2, l_c, l_st); break;
		case 87/* ds_grid_set_hx */: l_r = gml_node_tools_seek_or4(l__g.h_grid, l__g.h_index1, l__g.h_index2, l__g.h_val, l_c, l_st); break;
		case 88/* ds_grid_aop */: l_r = gml_node_tools_seek_or4(l__g.h_grid, l__g.h_index1, l__g.h_index2, l__g.h_val, l_c, l_st); break;
		case 89/* key_id */: l_r = gml_node_tools_seek_or2(l__g.h_obj, l__g.h_key, l_c, l_st); break;
		case 90/* key_id_set */: l_r = gml_node_tools_seek_or3(l__g.h_obj, l__g.h_key, l__g.h_val, l_c, l_st); break;
		case 91/* key_id_aop */: l_r = gml_node_tools_seek_or3(l__g.h_obj, l__g.h_key, l__g.h_val, l_c, l_st); break;
	}
	if (l_trouble) show_error("Can't seekAll over " + ast_gml_node_tools_ni_get_pos_string(l_q) + " " + gml_std_Type_enumConstructor(l_q), true);
	if (l_st != undefined) ds_list_delete(l_st, 0);
	return false;
}

if (live_enabled) 
function gml_node_tools_seek(l_q, l_st, l_c) {
	if (l_q == undefined) return false;
	if (l_st != undefined) ds_list_insert(l_st, 0, l_q);
	var l_result;
	var l__g = l_q;
	if (l__g.__enumIndex__/* gml_node */ == 96/* switch_hx */) {
		var l_x = l__g.h_expr;
		var l_m = l__g.h_cases;
		var l_o = l__g.h_def;
		if (l_c(l_x, l_st)) {
			l_result = true;
		} else {
			var l_n = array_length(l_m);
			var l_i;
			for (l_i = 0; l_i < l_n; l_i++) {
				var l_w = l_m[l_i].values;
				var l_l = array_length(l_w);
				var l_k;
				for (l_k = 0; l_k < l_l; l_k++) {
					if (l_c(l_w[l_k], l_st)) break;
				}
				if (l_k < l_l || l_c(l_m[l_i].expr, l_st)) break;
			}
			if (l_i < l_n) l_result = true; else l_result = l_o != undefined && l_c(l_o, l_st);
		}
		if (l_st != undefined) ds_list_delete(l_st, 0);
		return l_result;
	}
	var l_inf = ast_gml_node_def_info_array[gml_std_Type_enumIndex(l_q)];
	var l_def = l_q;
	var l_params = l_inf.h_params;
	var l_result1 = false;
	var l__names = l_def.__enumParams__;
	var l_i = 0;
	for (var l__g1 = array_length(l_params); l_i < l__g1; l_i++) {
		var l_v = l_def[$ l__names[l_i]];
		var l_result2;
		switch (l_params[l_i].h_type) {
			case 0: l_result2 = l_v != undefined && l_c(l_v, l_st); break;
			case 1:
				var l_arr = l_v;
				var l_found = false;
				var l_i1 = 0;
				for (var l__g3 = array_length(l_arr); l_i1 < l__g3; l_i1++) {
					if (l_c(l_arr[l_i1], l_st)) {
						l_found = true;
						break;
					}
				}
				l_result2 = l_found;
				break;
			default: l_result2 = false;
		}
		if (l_result2) {
			l_result1 = true;
			break;
		}
	}
	l_result = l_result1;
	if (l_st != undefined) ds_list_delete(l_st, 0);
	return l_result;
}

#endregion
