// GMLive.gml (c) YellowAfterlife, 2017+
// PLEASE DO NOT FORGET to remove paid extensions from your project when publishing the source code!
// And if you are using git, you can exclude GMLive by adding
// `scripts/GMLive*` and `extensions/GMLive/` lines to your `.gitignore`.
// Feather disable all

#region gml.seek_set_op

if (live_enabled) 
function gml_seek_set_op_resolve_set_op_rfn(l_q, l_st) {
	var l__g = l_q;
	switch (l__g.__enumIndex__/* gml_node */) {
		case 69/* index_set */:
			if (gml_node_tools_equals(gml_seek_set_op_resolve_set_op_xw, l__g.h_arr)) {
				gml_seek_set_op_resolve_set_op_safe = true;
				return true;
			}
			break;
		case 70/* index_aop */:
			if (gml_node_tools_equals(gml_seek_set_op_resolve_set_op_xw, l__g.h_arr)) {
				gml_seek_set_op_resolve_set_op_safe = true;
				return true;
			}
			break;
		case 72/* index2d_set */:
			if (gml_node_tools_equals(gml_seek_set_op_resolve_set_op_xw, l__g.h_arr)) {
				gml_seek_set_op_resolve_set_op_safe = true;
				return true;
			}
			break;
		case 73/* index2d_aop */:
			if (gml_node_tools_equals(gml_seek_set_op_resolve_set_op_xw, l__g.h_arr)) {
				gml_seek_set_op_resolve_set_op_safe = true;
				return true;
			}
			break;
		case 37/* set_op */:
			var l_x2 = l__g.h_a;
			var l_v2 = l__g.h_b;
			if (gml_node_tools_equals(gml_seek_set_op_resolve_set_op_xw, l_x2)) {
				var l__g1 = l_v2;
				gml_seek_set_op_resolve_set_op_safe = (l__g1.__enumIndex__ == 6);
				return true;
			}
			break;
	}
	return gml_node_tools_seek_all(l_q, l_st, gml_seek_set_op_resolve_set_op_rfn);
}

if (live_enabled) 
function gml_seek_set_op_proc(l_q, l_st) {
	var l__g = l_q;
	if (l__g.__enumIndex__/* gml_node */ == 37/* set_op */) {
		var l_d = l__g.h_d;
		var l_o = l__g.h_op;
		var l_x = l__g.h_a;
		var l_v = l__g.h_b;
		var l__g = gml_node_tools_unpack(l_x);
		switch (l__g.__enumIndex__/* gml_node */) {
			case 43/* local_hx */:
				var l_s = l__g.h_name;
				if (l_o != -1) gml_std_haxe_enum_tools_setTo(l_q, gml_node_local_aop(l_d, l_s, l_o, l_v)); else gml_std_haxe_enum_tools_setTo(l_q, gml_node_local_set(l_d, l_s, l_v));
				break;
			case 47/* static */:
				var l_s = l__g.h_name;
				if (l_o != -1) gml_std_haxe_enum_tools_setTo(l_q, gml_node_static_aop(l_d, l_s, l_o, l_v)); else gml_std_haxe_enum_tools_setTo(l_q, gml_node_static_set(l_d, l_s, l_v));
				break;
			case 50/* global_hx */:
				var l_s = l__g.h_name;
				if (l_o != -1) gml_std_haxe_enum_tools_setTo(l_q, gml_node_global_aop(l_d, l_s, l_o, l_v)); else gml_std_haxe_enum_tools_setTo(l_q, gml_node_global_set(l_d, l_s, l_v));
				break;
			case 20/* arg_const */: break;
			case 21/* arg_index */: break;
			case 53/* field */:
				var l_x1 = l__g.h_obj;
				var l_s = l__g.h_field;
				if (l_o != -1) gml_std_haxe_enum_tools_setTo(l_q, gml_node_field_aop(l_d, l_x1, l_s, l_o, l_v)); else gml_std_haxe_enum_tools_setTo(l_q, gml_node_field_set(l_d, l_x1, l_s, l_v));
				break;
			case 65/* alarm */:
				var l_x1 = l__g.h_obj;
				var l_i = l__g.h_index;
				if (l_o != -1) gml_std_haxe_enum_tools_setTo(l_q, gml_node_alarm_aop(l_d, l_x1, l_i, l_o, l_v)); else gml_std_haxe_enum_tools_setTo(l_q, gml_node_alarm_set_hx(l_d, l_x1, l_i, l_v));
				break;
			case 68/* index */:
				var l_xd = l__g.h_d;
				var l_xw = l__g.h_arr;
				var l__g1 = l_x;
				switch (l__g1.__enumIndex__/* gml_node */) {
					case 68/* index */:
						var l_xi = l__g1.h_index;
						if (l_o != -1) gml_std_haxe_enum_tools_setTo(l_q, gml_node_index_aop(l_xd, l_xw, l_xi, l_o, l_v)); else gml_std_haxe_enum_tools_setTo(l_q, gml_node_index_set(l_xd, l_xw, l_xi, l_v));
						break;
					case 71/* index2d */:
						var l_i1 = l__g1.h_index1;
						var l_i2 = l__g1.h_index2;
						if (l_o != -1) gml_std_haxe_enum_tools_setTo(l_q, gml_node_index2d_aop(l_xd, l_xw, l_i1, l_i2, l_o, l_v)); else gml_std_haxe_enum_tools_setTo(l_q, gml_node_index2d_set(l_xd, l_xw, l_i1, l_i2, l_v));
						break;
				}
				gml_seek_set_op_resolve_set_op_safe = false;
				gml_seek_set_op_resolve_set_op_xw = l_xw;
				gml_node_tools_seek_all_out(l_q, l_st, gml_seek_set_op_resolve_set_op_rfn, 0);
				var l_expr = l_xw;
				while (l_expr != undefined) {
					var l__g1 = l_expr;
					switch (l__g1.__enumIndex__/* gml_node */) {
						case 43/* local_hx */:
							gml_std_haxe_enum_tools_setTo(l_expr, gml_node_ensure_array_for_local(l__g1.h_d, l__g1.h_name));
							l_expr = undefined;
							break;
						case 50/* global_hx */:
							gml_std_haxe_enum_tools_setTo(l_expr, gml_node_ensure_array_for_global(l__g1.h_d, l__g1.h_name));
							l_expr = undefined;
							break;
						case 53/* field */:
							gml_std_haxe_enum_tools_setTo(l_expr, gml_node_ensure_array_for_field(l__g1.h_d, l__g1.h_obj, l__g1.h_field));
							l_expr = undefined;
							break;
						case 68/* index */:
							var l_x2 = l__g1.h_arr;
							gml_std_haxe_enum_tools_setTo(l_expr, gml_node_ensure_array_for_index(l__g1.h_d, l_x2, l__g1.h_index));
							l_expr = l_x2;
							break;
						case 71/* index2d */:
							var l_x3 = l__g1.h_arr;
							gml_std_haxe_enum_tools_setTo(l_expr, gml_node_ensure_array_for_index2d(l__g1.h_d, l_x3, l__g1.h_index1, l__g1.h_index2));
							l_expr = l_x3;
							break;
						default: l_expr = undefined;
					}
				}
				break;
			case 71/* index2d */:
				var l_xd = l__g.h_d;
				var l_xw = l__g.h_arr;
				var l__g1 = l_x;
				switch (l__g1.__enumIndex__/* gml_node */) {
					case 68/* index */:
						var l_xi = l__g1.h_index;
						if (l_o != -1) gml_std_haxe_enum_tools_setTo(l_q, gml_node_index_aop(l_xd, l_xw, l_xi, l_o, l_v)); else gml_std_haxe_enum_tools_setTo(l_q, gml_node_index_set(l_xd, l_xw, l_xi, l_v));
						break;
					case 71/* index2d */:
						var l_i1 = l__g1.h_index1;
						var l_i2 = l__g1.h_index2;
						if (l_o != -1) gml_std_haxe_enum_tools_setTo(l_q, gml_node_index2d_aop(l_xd, l_xw, l_i1, l_i2, l_o, l_v)); else gml_std_haxe_enum_tools_setTo(l_q, gml_node_index2d_set(l_xd, l_xw, l_i1, l_i2, l_v));
						break;
				}
				gml_seek_set_op_resolve_set_op_safe = false;
				gml_seek_set_op_resolve_set_op_xw = l_xw;
				gml_node_tools_seek_all_out(l_q, l_st, gml_seek_set_op_resolve_set_op_rfn, 0);
				var l_expr = l_xw;
				while (l_expr != undefined) {
					var l__g1 = l_expr;
					switch (l__g1.__enumIndex__/* gml_node */) {
						case 43/* local_hx */:
							gml_std_haxe_enum_tools_setTo(l_expr, gml_node_ensure_array_for_local(l__g1.h_d, l__g1.h_name));
							l_expr = undefined;
							break;
						case 50/* global_hx */:
							gml_std_haxe_enum_tools_setTo(l_expr, gml_node_ensure_array_for_global(l__g1.h_d, l__g1.h_name));
							l_expr = undefined;
							break;
						case 53/* field */:
							gml_std_haxe_enum_tools_setTo(l_expr, gml_node_ensure_array_for_field(l__g1.h_d, l__g1.h_obj, l__g1.h_field));
							l_expr = undefined;
							break;
						case 68/* index */:
							var l_x2 = l__g1.h_arr;
							gml_std_haxe_enum_tools_setTo(l_expr, gml_node_ensure_array_for_index(l__g1.h_d, l_x2, l__g1.h_index));
							l_expr = l_x2;
							break;
						case 71/* index2d */:
							var l_x3 = l__g1.h_arr;
							gml_std_haxe_enum_tools_setTo(l_expr, gml_node_ensure_array_for_index2d(l__g1.h_d, l_x3, l__g1.h_index1, l__g1.h_index2));
							l_expr = l_x3;
							break;
						default: l_expr = undefined;
					}
				}
				break;
			case 56/* env */:
				var l_av = l__g.h_v;
				var l_f = l_av.h_flags;
				if ((l_f & 1) == 0) {
					if ((l_f & 2) != 0) {
						var l_k = gml_node_number(l_d, 0, undefined);
						if (l_o != -1) gml_std_haxe_enum_tools_setTo(l_q, gml_node_env1d_aop(l_d, l_av, l_k, l_o, l_v)); else gml_std_haxe_enum_tools_setTo(l_q, gml_node_env1d_set(l_d, l_av, l_k, l_v));
					} else if (l_o != -1) {
						gml_std_haxe_enum_tools_setTo(l_q, gml_node_env_aop(l_d, l_av, l_o, l_v));
					} else gml_std_haxe_enum_tools_setTo(l_q, gml_node_env_set(l_d, l_av, l_v));
				} else return gml_program_seek_inst.h_error("`" + l_av.h_name + "` is read-only", l__g.h_d);
				break;
			case 59/* env_fd */:
				var l_av = l__g.h_v;
				if ((l_av.h_flags & 1) == 0) {
					if (l_o != -1) gml_std_haxe_enum_tools_setTo(l_q, gml_node_env_fd_aop(l_d, l__g.h_obj, l_av, l_o, l_v)); else gml_std_haxe_enum_tools_setTo(l_q, gml_node_env_fd_set(l_d, l__g.h_obj, l_av, l_v));
				} else return gml_program_seek_inst.h_error("`" + l_av.h_name + "` is read-only", l__g.h_d);
				break;
			case 62/* env1d */:
				var l_av = l__g.h_v;
				if ((l_av.h_flags & 1) == 0) {
					if (l_o != -1) gml_std_haxe_enum_tools_setTo(l_q, gml_node_env1d_aop(l_d, l_av, l__g.h_index, l_o, l_v)); else gml_std_haxe_enum_tools_setTo(l_q, gml_node_env1d_set(l_d, l_av, l__g.h_index, l_v));
				} else return gml_program_seek_inst.h_error("`" + l_av.h_name + "` is read-only", l__g.h_d);
				break;
			case 80/* ds_list */:
				var l_x1 = l__g.h_list;
				var l_k = l__g.h_index;
				if (l_o != -1) gml_std_haxe_enum_tools_setTo(l_q, gml_node_ds_list_aop(l_d, l_x1, l_k, l_o, l_v)); else gml_std_haxe_enum_tools_setTo(l_q, gml_node_ds_list_set_hx(l_d, l_x1, l_k, l_v));
				break;
			case 83/* ds_map */:
				var l_x1 = l__g.h_map;
				var l_k = l__g.h_key;
				if (l_o != -1) gml_std_haxe_enum_tools_setTo(l_q, gml_node_ds_map_aop(l_d, l_x1, l_k, l_o, l_v)); else gml_std_haxe_enum_tools_setTo(l_q, gml_node_ds_map_set_hx(l_d, l_x1, l_k, l_v));
				break;
			case 86/* ds_grid */:
				var l_x1 = l__g.h_grid;
				var l_i = l__g.h_index1;
				var l_k = l__g.h_index2;
				if (l_o != -1) gml_std_haxe_enum_tools_setTo(l_q, gml_node_ds_grid_aop(l_d, l_x1, l_i, l_k, l_o, l_v)); else gml_std_haxe_enum_tools_setTo(l_q, gml_node_ds_grid_set_hx(l_d, l_x1, l_i, l_k, l_v));
				break;
			case 74/* raw_id */:
				var l_x1 = l__g.h_arr;
				var l_k = l__g.h_index;
				if (l_o != -1) gml_std_haxe_enum_tools_setTo(l_q, gml_node_raw_id_aop(l_d, l_x1, l_k, l_o, l_v)); else gml_std_haxe_enum_tools_setTo(l_q, gml_node_raw_id_set(l_d, l_x1, l_k, l_v));
				break;
			case 77/* raw_id2d */:
				var l_x1 = l__g.h_arr;
				var l_i = l__g.h_index1;
				var l_k = l__g.h_index2;
				if (l_o != -1) gml_std_haxe_enum_tools_setTo(l_q, gml_node_raw_id2d_aop(l_d, l_x1, l_i, l_k, l_o, l_v)); else gml_std_haxe_enum_tools_setTo(l_q, gml_node_raw_id2d_set(l_d, l_x1, l_i, l_k, l_v));
				break;
			case 89/* key_id */:
				var l_x1 = l__g.h_obj;
				var l_k = l__g.h_key;
				if (l_o != -1) gml_std_haxe_enum_tools_setTo(l_q, gml_node_key_id_aop(l_d, l_x1, l_k, l_o, l_v)); else gml_std_haxe_enum_tools_setTo(l_q, gml_node_key_id_set(l_d, l_x1, l_k, l_v));
				break;
			default: return gml_program_seek_inst.h_error("Expression is not settable", gml_std_haxe_enum_tools_getParameter(l_x, 0));
		}
	}
	return gml_node_tools_seek(l_q, l_st, gml_program_seek_func);
}

#endregion
