// GMLive.gml (c) YellowAfterlife, 2017+
// PLEASE DO NOT FORGET to remove paid extensions from your project when publishing the source code!
// And if you are using git, you can exclude GMLive by adding
// `scripts/GMLive*` and `extensions/GMLive/` lines to your `.gitignore`.
// Feather disable all

// converts tokens to AST!
#region gml.builder

if (live_enabled) 
function gml_builder(l_pg, l_src) constructor {
	static h_tokens = undefined; /// @is {array<gml_token>}
	static h_source = undefined; /// @is {gml_source}
	static h_offset = undefined; /// @is {int}
	static h_length = undefined; /// @is {int}
	static h_scripts = undefined; /// @is {array<gml_script>}
	static h_enums = undefined; /// @is {array<gml_enum>}
	static h_macro_names = undefined; /// @is {array<string>}
	static h_macro_nodes = undefined; /// @is {array<gml_macro>}
	static h_global_vars = undefined; /// @is {array<string>}
	static h_run = function() {
		if (self.h_error_text == undefined) self.h_build_loop(self.h_source.h_main);
	}
	static h_error_text = undefined; /// @is {string}
	static h_error_pos = undefined; /// @is {gml_pos}
	static h_error_at = function(l_text, l_pos) {
		self.h_error_text = l_pos.h_to_string() + ": " + l_text;
		self.h_error_pos = l_pos;
		return true;
	}
	static h_error = function(l_text, l_tk) {
		return self.h_error_at(l_text, l_tk.h_d);
	}
	static h_expect = function(l_text, l_tk) {
		return self.h_error("Expected " + l_text + ", got " + gml_std_Type_enumConstructor(l_tk), l_tk);
	}
	static h_expect_node = function(l_text, l_node) {
		return self.h_error_at("Expected " + l_text + ", got " + gml_std_Type_enumConstructor(l_node), gml_std_haxe_enum_tools_getParameter(l_node, 0));
	}
	static h_out_node = undefined; /// @is {ast_GmlNode}
	static h_current_script = undefined; /// @is {string}
	static h_current_script_ref = undefined; /// @is {gml_script}
	static h_build_ops = function(l_firstPos, l_firstOp) {
		self.h_offset += 1;
		var l_nodes = ds_list_create();
		ds_list_add(l_nodes, self.h_out_node);
		var l_ops = ds_list_create();
		ds_list_add(l_ops, l_firstOp);
		var l_locs = ds_list_create();
		ds_list_add(l_locs, l_firstPos);
		var l_proc = true;
		var l_i;
		while (l_proc && self.h_offset < self.h_length) {
			if (self.h_build_expr(1)) {
				ds_list_destroy(l_nodes);
				ds_list_destroy(l_ops);
				ds_list_destroy(l_locs);
				return true;
			}
			ds_list_add(l_nodes, self.h_out_node);
			if (self.h_offset < self.h_length) {
				var l__g = self.h_tokens[self.h_offset];
				switch (l__g.__enumIndex__/* gml_token */) {
					case 19/* bin_op */:
						self.h_offset += 1;
						ds_list_add(l_locs, l__g.h_d);
						ds_list_add(l_ops, l__g.h_op);
						break;
					case 20/* set_op */:
						if (l__g.h_op == -1) {
							self.h_offset += 1;
							ds_list_add(l_locs, l__g.h_d);
							ds_list_add(l_ops, 64);
						} else l_proc = false;
						break;
					default: l_proc = false;
				}
			}
		}
		var l_pmin = 7;
		var l_pmax = 0;
		var l_n = ds_list_size(l_ops);
		for (l_i = 0; l_i < l_n; l_i++) {
			var l_pcur = gml_op_get_priority(ds_list_find_value(l_ops, l_i));
			if (l_pcur < l_pmin) l_pmin = l_pcur;
			if (l_pcur > l_pmax) l_pmax = l_pcur;
		}
		while (l_pmin <= l_pmax) {
			for (l_i = 0; l_i < l_n; l_i++) {
				if (gml_op_get_priority(ds_list_find_value(l_ops, l_i)) == l_pmin) {
					ds_list_set(l_nodes, l_i, gml_node_bin_op(ds_list_find_value(l_locs, l_i), ds_list_find_value(l_ops, l_i), ds_list_find_value(l_nodes, l_i), ds_list_find_value(l_nodes, l_i + 1)));
					ds_list_delete(l_nodes, l_i + 1);
					ds_list_delete(l_ops, l_i);
					ds_list_delete(l_locs, l_i);
					l_n--;
					l_i--;
				}
			}
			l_pmin++;
		}
		self.h_out_node = ds_list_find_value(l_nodes, 0);
		ds_list_destroy(l_nodes);
		ds_list_destroy(l_ops);
		ds_list_destroy(l_locs);
		return false;
	}
	static h_build_args = function(l_pos, l_sqb) {
		var l_args1 = [];
		var l_proc = true;
		var l_seenComma = true;
		var l_func = self.h_out_node;
		while (l_proc && self.h_offset < self.h_length) {
			var l_tk = self.h_tokens[self.h_offset];
			switch (l_tk.__enumIndex__/* gml_token */) {
				case 22/* par_close */:
					if (l_sqb) {
						return self.h_error("Unexpected `)`", l_tk);
					} else {
						l_proc = false;
						self.h_offset += 1;
					}
					break;
				case 24/* sqb_close */:
					if (l_sqb) {
						l_proc = false;
						self.h_offset += 1;
					} else return self.h_error("Unexpected `]`", l_tk);
					break;
				case 5/* comma */:
					if (l_seenComma) {
						array_push(l_args1, gml_node_undefined_hx(l_tk.h_d));
						self.h_offset += 1;
					} else {
						l_seenComma = true;
						self.h_offset += 1;
					}
					break;
				default:
					if (l_seenComma) {
						l_seenComma = false;
						if (self.h_build_expr(0)) return true;
						array_push(l_args1, self.h_out_node);
					} else return self.h_expect("a comma or closing token.", l_tk);
			}
		}
		if (l_proc) return self.h_error_at("Unclosed list", l_pos);
		if (l_sqb) self.h_out_node = gml_node_array_decl(l_pos, l_args1); else self.h_out_node = gml_node_call(l_pos, l_func, l_args1);
		return false;
	}
	static h_build_expr = function(l_flags) {
		if (self.h_offset >= self.h_length) return self.h_error_at("Expected an expression", self.h_source.h_get_eof());
		var l_proc, l_sep, l_i, l_n, l_s, l_tk;
		var l_tk0 = self.h_tokens[self.h_offset++];
		var l_node, l_node2, l_nodes;
		switch (l_tk0.__enumIndex__/* gml_token */) {
			case 13/* undefined_hx */: self.h_out_node = gml_node_undefined_hx(l_tk0.h_d); break;
			case 15/* number */: self.h_out_node = gml_node_number(l_tk0.h_d, l_tk0.h_nu, l_tk0.h_src); break;
			case 14/* boolean */: self.h_out_node = gml_node_boolean(l_tk0.h_d, l_tk0.h_value); break;
			case 16/* cstring */: self.h_out_node = gml_node_cstring(l_tk0.h_d, l_tk0.h_st); break;
			case 23/* sqb_open */:
				l_proc = true;
				l_sep = true;
				self.h_build_args(l_tk0.h_d, true);
				break;
			case 12/* ident */:
				var l_s1 = l_tk0.h_id;
				switch (l_s1) {
					case "self": self.h_out_node = gml_node_self_hx(l_tk0.h_d); break;
					case "other": self.h_out_node = gml_node_other_hx(l_tk0.h_d); break;
					default:
						if (gml_asset_index.h_obj[$ l_s1] != undefined) {
							l_i = gml_asset_index.h_obj[$ l_s1];
							self.h_out_node = gml_node_number(l_tk0.h_d, l_i, undefined);
						} else {
							var l_m = self.h_program.h_macro_map.h_obj[$ l_s1];
							if (l_m != undefined && l_m.h_is_expr) {
								self.h_out_node = gml_node_tools_clone(l_m.h_node);
							} else {
								l_i = gml_std_gml_internal_ArrayImpl_indexOf(self.h_macro_names, l_s1);
								if (l_i >= 0) {
									l_m = self.h_macro_nodes[l_i];
									if (l_m.h_is_expr) self.h_out_node = gml_node_tools_clone(l_m.h_node); else self.h_out_node = gml_node_ident(l_tk0.h_d, l_s1);
								} else self.h_out_node = gml_node_ident(l_tk0.h_d, l_s1);
							}
						}
				}
				break;
			case 27/* arg_const */: self.h_out_node = gml_node_arg_const(l_tk0.h_d, l_tk0.h_i); break;
			case 17/* un_op */:
				if (self.h_build_expr(1)) return true;
				var l__g = self.h_out_node;
				if (l__g.__enumIndex__/* gml_node */ == 2/* number */) {
					var l_f = l__g.h_value;
					switch (l_tk0.h_op) {
						case 2: l_f = ~(l_f | 0); break;
						case 0: l_f = -l_f; break;
						case 1: l_f = (l_f > 0.5 ? 0 : 1); break;
					}
					self.h_out_node = gml_node_number(l_tk0.h_d, l_f, undefined);
				} else self.h_out_node = gml_node_un_op(l_tk0.h_d, self.h_out_node, l_tk0.h_op);
				break;
			case 18/* adjfix */:
				if (self.h_build_expr(1)) return true;
				self.h_out_node = gml_node_prefix(l_tk0.h_d, self.h_out_node, l_tk0.h_inc);
				break;
			case 19/* bin_op */:
				var l__g = l_tk0.h_d;
				switch (l_tk0.h_op) {
					case 16: if (self.h_build_expr(1)) return true; break;
					case 17:
						var l_d = l__g;
						if (self.h_build_expr(1)) return true;
						var l__g = self.h_out_node;
						if (l__g.__enumIndex__/* gml_node */ == 2/* number */) self.h_out_node = gml_node_number(l_d, -l__g.h_value, undefined); else self.h_out_node = gml_node_un_op(l_d, self.h_out_node, 0);
						break;
					default: if ((l_flags & 4) != 0) return self.h_expect("a statement", l_tk0); else return self.h_expect("a value", l_tk0);
				}
				break;
			case 21/* par_open */:
				if (self.h_build_expr(0)) return true;
				if (self.h_offset >= self.h_length) return self.h_error("Unclosed parenthesis", l_tk0);
				if (self.h_offset >= self.h_length) {
					return self.h_error_at("Expected a closing parenthesis", self.h_source.h_get_eof());
				} else if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 22/* par_close */) {
					self.h_offset += 1;
				} else return self.h_error("Expected a closing parenthesis", self.h_tokens[self.h_offset]);
				break;
			case 25/* cub_open */:
				var l_keys = [];
				l_nodes = [];
				l_proc = true;
				var l__g = self.h_tokens[self.h_offset];
				if ((l__g.__enumIndex__ == 26)) {
					self.h_offset += 1;
				} else while (l_proc && self.h_offset < self.h_length) {
					var l__g = self.h_tokens[self.h_offset];
					switch (l__g.__enumIndex__/* gml_token */) {
						case 12/* ident */:
							l_s = l__g.h_id;
							array_push(l_keys, l_s);
							self.h_offset += 1;
							if (self.h_offset >= self.h_length) {
								return self.h_error_at("Expected a `:` in object declaration", self.h_source.h_get_eof());
							} else if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 7/* colon */) {
								self.h_offset += 1;
							} else return self.h_error("Expected a `:` in object declaration", self.h_tokens[self.h_offset]);
							if (self.h_build_expr(0)) return true;
							array_push(l_nodes, self.h_out_node);
							switch (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */) {
								case 5/* comma */:
									self.h_offset += 1;
									if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 26/* cub_close */) {
										self.h_offset += 1;
										l_proc = false;
									}
									break;
								case 26/* cub_close */:
									self.h_offset += 1;
									l_proc = false;
									break;
								default: return self.h_expect("a `,` or a `}` in object declaration", self.h_tokens[self.h_offset]);
							}
							break;
						case 16/* cstring */:
							l_s = l__g.h_st;
							array_push(l_keys, l_s);
							self.h_offset += 1;
							if (self.h_offset >= self.h_length) {
								return self.h_error_at("Expected a `:` in object declaration", self.h_source.h_get_eof());
							} else if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 7/* colon */) {
								self.h_offset += 1;
							} else return self.h_error("Expected a `:` in object declaration", self.h_tokens[self.h_offset]);
							if (self.h_build_expr(0)) return true;
							array_push(l_nodes, self.h_out_node);
							switch (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */) {
								case 5/* comma */:
									self.h_offset += 1;
									if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 26/* cub_close */) {
										self.h_offset += 1;
										l_proc = false;
									}
									break;
								case 26/* cub_close */:
									self.h_offset += 1;
									l_proc = false;
									break;
								default: return self.h_expect("a `,` or a `}` in object declaration", self.h_tokens[self.h_offset]);
							}
							break;
						default: return self.h_expect("a key-value pair or a `}` in object declaration", self.h_tokens[self.h_offset]);
					}
				}
				self.h_out_node = gml_node_object_decl(l_tk0.h_d, l_keys, l_nodes);
				break;
			case 0/* header */: if ((l_flags & 4) != 0) return self.h_error("Expected a statement, got a header (did you miss a closing bracket?)", l_tk0); else return self.h_error("Expected an expression, got a header (did you miss a closing parenthesis?)", l_tk0);
			case 11/* keyword */:
				switch (l_tk0.h_kw) {
					case 0:
						var l_d = l_tk0.h_d;
						if (self.h_offset >= self.h_length) {
							self.h_out_node = gml_node_global_ref(l_d);
						} else if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 6/* period */) {
							l_tk = self.h_tokens[self.h_offset++];
							if (self.h_offset >= self.h_length) {
								return self.h_expect("a field name", l_tk);
							} else {
								var l__g1 = self.h_tokens[self.h_offset];
								if (l__g1.__enumIndex__/* gml_token */ == 12/* ident */) {
									self.h_offset += 1;
									self.h_out_node = gml_node_global_hx(l__g1.h_d, l__g1.h_id);
								} else return self.h_expect("a field name", self.h_tokens[self.h_offset]);
							}
						} else self.h_out_node = gml_node_global_ref(l_d);
						break;
					case 26:
						if (self.h_offset >= self.h_length) {
							return self.h_error_at("Expected an opening square bracket", self.h_source.h_get_eof());
						} else if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 23/* sqb_open */) {
							self.h_offset += 1;
						} else return self.h_error("Expected an opening square bracket", self.h_tokens[self.h_offset]);
						if (self.h_build_expr(0)) return true;
						if (self.h_offset >= self.h_length) {
							return self.h_error_at("Expected a closing square bracket", self.h_source.h_get_eof());
						} else if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 24/* sqb_close */) {
							self.h_offset += 1;
						} else return self.h_error("Expected a closing square bracket", self.h_tokens[self.h_offset]);
						self.h_out_node = gml_node_arg_index(l_tk0.h_d, self.h_out_node);
						break;
					case 27: self.h_out_node = gml_node_arg_count(l_tk0.h_d); break;
					case 25:
						if (self.h_build_expr(l_flags)) return true;
						var l__g1 = self.h_out_node;
						if (l__g1.__enumIndex__/* gml_node */ == 23/* call */) self.h_out_node = gml_node_construct(l__g1.h_d, l__g1.h_expr, l__g1.h_args); else return self.h_expect("a callable value after `new`", l_tk0);
						break;
					case 24:
						if (self.h_offset >= self.h_length) return self.h_error_at("Expected a function name or `(`", self.h_source.h_get_eof());
						var l_oldName = self.h_current_script;
						var l_oldScript = self.h_current_script_ref;
						l_i = 0;
						while (true) {
							l_s = l_oldName + "+" + string(++l_i);
							l_n = array_length(self.h_scripts);
							while (--l_n >= 0) {
								if (self.h_scripts[l_n].h_name == l_s) break;
							}
							if (l_n <= 0) break;
						}
						var l_scrName;
						var l__g1 = self.h_tokens[self.h_offset];
						if (l__g1.__enumIndex__/* gml_token */ == 12/* ident */) {
							var l__name = l__g1.h_id;
							self.h_offset += 1;
							l_scrName = l__name;
						} else l_scrName = undefined;
						if (self.h_offset >= self.h_length) {
							return self.h_error_at("Expected an opening `(`", self.h_source.h_get_eof());
						} else if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 21/* par_open */) {
							self.h_offset += 1;
						} else return self.h_error("Expected an opening `(`", self.h_tokens[self.h_offset]);
						if (self.h_build_script_args()) return true;
						var l_isConstructor = false;
						var l_tmp;
						if (self.h_offset < self.h_length) {
							var l__g1 = self.h_tokens[self.h_offset];
							if (l__g1.__enumIndex__/* gml_token */ == 12/* ident */) l_tmp = l__g1.h_id == "constructor"; else l_tmp = false;
						} else l_tmp = false;
						if (l_tmp) {
							l_isConstructor = true;
							self.h_offset += 1;
						}
						var l_argPrefix = self.h_build_script_args_prefix;
						var l_scr = self.h_add_script(l_s, self.h_build_script_args_map, self.h_build_script_args_argc, true, []);
						l_scr.h_is_constructor = l_isConstructor;
						self.h_build_script_args_map = undefined;
						self.h_current_script = l_s;
						self.h_current_script_ref = l_scr;
						if (self.h_offset >= self.h_length) return self.h_error_at("Expected function body", self.h_source.h_get_eof());
						l_tk = self.h_tokens[self.h_offset];
						if (l_tk.__enumIndex__/* gml_token */ == 25/* cub_open */) var l__g1 = l_tk.h_d; else return self.h_expect("a `{`", self.h_tokens[self.h_offset]);
						self.h_build_line();
						if (l_argPrefix != undefined) {
							array_push(l_argPrefix, self.h_out_node);
							l_scr.h_node = gml_node_block(gml_std_haxe_enum_tools_getParameter(self.h_out_node, 0), l_argPrefix);
						} else l_scr.h_node = self.h_out_node;
						self.h_out_node = gml_node_func_literal(l_tk0.h_d, l_s);
						self.h_current_script = l_oldName;
						self.h_current_script_ref = l_oldScript;
						break;
					default: if ((l_flags & 4) != 0) return self.h_expect("a statement", l_tk0); else return self.h_expect("a value", l_tk0);
				}
				break;
			default: if ((l_flags & 4) != 0) return self.h_expect("a statement", l_tk0); else return self.h_expect("a value", l_tk0);
		}
		l_proc = true;
		while (l_proc && self.h_offset < self.h_length) {
			l_tk = self.h_tokens[self.h_offset];
			switch (l_tk.__enumIndex__/* gml_token */) {
				case 18/* adjfix */:
					if ((l_flags & 2) == 0) {
						self.h_offset += 1;
						self.h_out_node = gml_node_postfix(l_tk.h_d, self.h_out_node, l_tk.h_inc);
						l_flags |= 2;
					} else if (l_tk.h_inc) {
						return self.h_error_at("Unexpected `++`", l_tk.h_d);
					} else return self.h_error_at("Unexpected `--`", l_tk.h_d);
					break;
				case 6/* period */:
					if ((l_flags & 2) == 0) {
						self.h_offset += 1;
						var l__g = self.h_tokens[self.h_offset];
						if (l__g.__enumIndex__/* gml_token */ == 12/* ident */) {
							l_s = l__g.h_id;
							self.h_offset += 1;
							self.h_out_node = gml_node_field(l_tk.h_d, self.h_out_node, l_s);
						} else return self.h_error("Expected a field name", self.h_tokens[self.h_offset]);
					} else return self.h_error("Unexpected period", self.h_tokens[self.h_offset]);
					break;
				case 21/* par_open */:
					if ((l_flags & 2) == 0) {
						self.h_offset += 1;
						if (self.h_build_args(l_tk.h_d, false)) return true;
					} else return self.h_error_at("Unexpected `(`", l_tk.h_d);
					break;
				case 23/* sqb_open */:
					var l_d4 = l_tk.h_d;
					if ((l_flags & 2) == 0) {
						self.h_offset += 1;
						if (self.h_offset >= self.h_length) return self.h_error_at("Expected an index", self.h_source.h_get_eof());
						l_node = self.h_out_node;
						var l__g6 = self.h_tokens[self.h_offset];
						switch (l__g6.__enumIndex__/* gml_token */) {
							case 19/* bin_op */:
								if (l__g6.h_op == 48) {
									self.h_offset += 1;
									if (self.h_build_expr(0)) return true;
									if (self.h_offset >= self.h_length) {
										return self.h_error_at("Expected a closing bracket", self.h_source.h_get_eof());
									} else if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 24/* sqb_close */) {
										self.h_offset += 1;
									} else return self.h_error("Expected a closing bracket", self.h_tokens[self.h_offset]);
									self.h_out_node = gml_node_ds_list(l_d4, l_node, self.h_out_node);
								} else l_proc = false;
								break;
							case 8/* qmark */:
								self.h_offset += 1;
								if (self.h_build_expr(0)) return true;
								if (self.h_offset >= self.h_length) {
									return self.h_error_at("Expected a closing bracket", self.h_source.h_get_eof());
								} else if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 24/* sqb_close */) {
									self.h_offset += 1;
								} else return self.h_error("Expected a closing bracket", self.h_tokens[self.h_offset]);
								self.h_out_node = gml_node_ds_map(l_d4, l_node, self.h_out_node);
								break;
							case 3/* hash */:
								self.h_offset += 1;
								if (self.h_build_expr(0)) return true;
								l_node2 = self.h_out_node;
								if (self.h_offset >= self.h_length) {
									return self.h_error_at("Expected a comma", self.h_source.h_get_eof());
								} else if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 5/* comma */) {
									self.h_offset += 1;
								} else return self.h_error("Expected a comma", self.h_tokens[self.h_offset]);
								if (self.h_build_expr(0)) return true;
								if (self.h_offset >= self.h_length) {
									return self.h_error_at("Expected a closing bracket", self.h_source.h_get_eof());
								} else if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 24/* sqb_close */) {
									self.h_offset += 1;
								} else return self.h_error("Expected a closing bracket", self.h_tokens[self.h_offset]);
								self.h_out_node = gml_node_ds_grid(l_d4, l_node, l_node2, self.h_out_node);
								break;
							case 10/* dollar_sign */:
								self.h_offset += 1;
								if (self.h_build_expr(0)) return true;
								if (self.h_offset >= self.h_length) {
									return self.h_error_at("Expected a closing bracket", self.h_source.h_get_eof());
								} else if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 24/* sqb_close */) {
									self.h_offset += 1;
								} else return self.h_error("Expected a closing bracket", self.h_tokens[self.h_offset]);
								self.h_out_node = gml_node_key_id(l_d4, l_node, self.h_out_node);
								break;
							case 9/* at_sign */:
								self.h_offset += 1;
								if (self.h_build_expr(0)) return true;
								if (self.h_offset >= self.h_length) return self.h_error_at("Expected comma or a closing bracket", self.h_source.h_get_eof());
								switch (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */) {
									case 5/* comma */:
										self.h_offset += 1;
										l_node2 = self.h_out_node;
										if (self.h_build_expr(0)) return true;
										if (self.h_offset >= self.h_length) {
											return self.h_error_at("Expected a closing bracket", self.h_source.h_get_eof());
										} else if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 24/* sqb_close */) {
											self.h_offset += 1;
										} else return self.h_error("Expected a closing bracket", self.h_tokens[self.h_offset]);
										self.h_out_node = gml_node_raw_id2d(l_d4, l_node, l_node2, self.h_out_node);
										break;
									case 24/* sqb_close */:
										self.h_offset += 1;
										self.h_out_node = gml_node_raw_id(l_d4, l_node, self.h_out_node);
										break;
									default: self.h_expect("comma or a closing bracket", self.h_tokens[self.h_offset]);
								}
								break;
							default: l_proc = false;
						}
						if (!l_proc) {
							l_proc = true;
							if (self.h_build_expr(0)) return true;
							if (self.h_offset >= self.h_length) return self.h_error_at("Expected comma or a closing bracket", self.h_source.h_get_eof());
							switch (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */) {
								case 5/* comma */:
									self.h_offset += 1;
									l_node2 = self.h_out_node;
									if (self.h_build_expr(0)) return true;
									if (self.h_offset >= self.h_length) {
										return self.h_error_at("Expected a closing bracket", self.h_source.h_get_eof());
									} else if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 24/* sqb_close */) {
										self.h_offset += 1;
									} else return self.h_error("Expected a closing bracket", self.h_tokens[self.h_offset]);
									self.h_out_node = gml_node_index2d(l_d4, l_node, l_node2, self.h_out_node);
									break;
								case 24/* sqb_close */:
									self.h_offset += 1;
									self.h_out_node = gml_node_index(l_d4, l_node, self.h_out_node);
									break;
								default: self.h_expect("comma or a closing bracket", self.h_tokens[self.h_offset]);
							}
						}
					} else return self.h_error_at("Unexpected `[`", l_d4);
					break;
				case 19/* bin_op */:
					if ((l_flags & 1) == 0) {
						if (self.h_build_ops(l_tk.h_d, l_tk.h_op)) return true;
						l_flags |= 2;
					} else l_proc = false;
					break;
				case 20/* set_op */:
					var l__g5 = l_tk.h_op;
					if (l__g5 == -1) {
						var l_p1 = l_tk.h_d;
						if ((l_flags & 4) != 0) {
							l_node = self.h_out_node;
							self.h_offset += 1;
							if (self.h_build_expr(0)) return true;
							self.h_out_node = gml_node_set_op(l_p1, -1, l_node, self.h_out_node);
							l_proc = false;
						} else if ((l_flags & 1) == 0) {
							if (self.h_build_ops(l_p1, 64)) return true;
							l_flags |= 2;
						} else l_proc = false;
					} else {
						var l_o1 = l__g5;
						var l_p2 = l_tk.h_d;
						if ((l_flags & 4) != 0) {
							l_node = self.h_out_node;
							self.h_offset += 1;
							if (self.h_build_expr(0)) return true;
							self.h_out_node = gml_node_set_op(l_p2, l_o1, l_node, self.h_out_node);
						}
						l_proc = false;
					}
					break;
				case 28/* null_co */:
					if ((l_flags & 1) == 0) {
						l_node = self.h_out_node;
						self.h_offset += 1;
						if (self.h_build_expr(0)) return true;
						l_flags |= 2;
						self.h_out_node = gml_node_null_co(l_tk.h_d, l_node, self.h_out_node);
					} else l_proc = false;
					break;
				case 29/* null_co_set */:
					var l_p4 = l_tk.h_d;
					if ((l_flags & 4) != 0) {
						l_node = self.h_out_node;
						self.h_offset += 1;
						if (self.h_build_expr(0)) return true;
						self.h_out_node = gml_node_set_op(l_p4, -1, gml_node_tools_clone(l_node), self.h_out_node);
						l_node2 = gml_node_undefined_hx(l_p4);
						l_node = gml_node_bin_op(l_p4, 64, l_node, l_node2);
						self.h_out_node = gml_node_if_then(l_p4, l_node, self.h_out_node);
					}
					l_proc = false;
					break;
				case 8/* qmark */:
					if ((l_flags & 1) == 0) {
						self.h_offset += 1;
						l_node = self.h_out_node;
						if (self.h_build_expr(0)) return true;
						l_node2 = self.h_out_node;
						if (self.h_offset >= self.h_length) {
							return self.h_error_at("Expected an else-colon", self.h_source.h_get_eof());
						} else if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 7/* colon */) {
							self.h_offset += 1;
						} else return self.h_error("Expected an else-colon", self.h_tokens[self.h_offset]);
						if (self.h_build_expr(0)) return true;
						self.h_out_node = gml_node_ternary(l_tk.h_d, l_node, l_node2, self.h_out_node);
					} else l_proc = false;
					break;
				default: l_proc = false;
			}
		}
		return false;
	}
	static h_build_line_inner = function(l_reqStatement) {
		if (self.h_offset >= self.h_length) return self.h_error_at("Expected a statement", self.h_source.h_get_eof());
		var l_tk = self.h_tokens[self.h_offset++];
		var l_tk2, l_proc, l_sep, l_x, l_x1, l_x2, l_nodes, l_i, l_s, l_d;
		var l_unknown = false;
		switch (l_tk.__enumIndex__/* gml_token */) {
			case 11/* keyword */:
				var l__g = l_tk.h_d;
				switch (l_tk.h_kw) {
					case 1:
						l_d = l__g;
						l_nodes = [];
						l_x1 = gml_node_block(l_d, l_nodes);
						while (self.h_offset < self.h_length) {
							l_tk2 = self.h_tokens[self.h_offset++];
							if (l_tk2.__enumIndex__/* gml_token */ == 12/* ident */) {
								l_d = l_tk2.h_d;
								l_s = l_tk2.h_id;
								array_push(self.h_global_vars, l_s);
								l_i = array_length(self.h_macro_names);
								self.h_macro_names[@l_i] = l_s;
								self.h_macro_nodes[@l_i] = new gml_macro(l_s, gml_node_global_hx(l_d, l_s), true, false);
								var l__g1 = self.h_tokens[self.h_offset];
								if (l__g1.__enumIndex__/* gml_token */ == 20/* set_op */) {
									if (l__g1.h_op == -1) {
										self.h_offset += 1;
										if (self.h_build_expr(0)) return true;
										l_x = gml_node_global_set(l_d, l_s, self.h_out_node);
										array_push(l_nodes, l_x);
									}
								}
								if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 5/* comma */) {
									self.h_offset += 1;
									continue;
								}
							} else return self.h_error("Expected a global variable name.", l_tk2);
							break;
						}
						self.h_out_node = l_x1;
						break;
					case 2:
						var l_d = l__g;
						l_nodes = [];
						l_proc = true;
						while (l_proc && self.h_offset < self.h_length) {
							l_tk2 = self.h_tokens[self.h_offset++];
							switch (l_tk2.__enumIndex__/* gml_token */) {
								case 11/* keyword */: if (l_tk2.h_kw == 2) var l_d1 = l_tk2.h_d; else return self.h_expect("a variable name", l_tk2); break;
								case 12/* ident */:
									if (self.h_offset >= self.h_length) return self.h_error_at("Expected a variable value", self.h_source.h_get_eof());
									l_tk = self.h_tokens[self.h_offset];
									if (l_tk.__enumIndex__/* gml_token */ == 20/* set_op */) {
										if (l_tk.h_op == -1) {
											self.h_offset += 1;
											if (self.h_build_expr(0)) return true;
										} else self.h_out_node = undefined;
									} else self.h_out_node = undefined;
									array_push(l_nodes, gml_node_var_decl(l_tk2.h_d, l_tk2.h_id, self.h_out_node));
									if (self.h_offset < self.h_length) switch (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */) {
										case 5/* comma */: self.h_offset += 1; break;
										case 4/* semico */:
											self.h_offset += 1;
											l_proc = false;
											break;
										default: l_proc = false;
									}
									break;
								default: return self.h_expect("a variable name", l_tk2);
							}
						}
						if (array_length(l_nodes) != 1) self.h_out_node = gml_node_block(l_d, l_nodes); else self.h_out_node = l_nodes[0];
						break;
					case 3:
						var l_e;
						var l__g1 = self.h_tokens[self.h_offset];
						if (l__g1.__enumIndex__/* gml_token */ == 12/* ident */) {
							var l_d1 = l__g1.h_d;
							var l_s1 = l__g1.h_id;
							self.h_offset += 1;
							l_e = new gml_enum(l_s1, l_d1);
						} else return self.h_error("Expected an enum name", self.h_tokens[self.h_offset]);
						if (self.h_offset >= self.h_length) {
							return self.h_error_at("Expected enum block", self.h_source.h_get_eof());
						} else if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 25/* cub_open */) {
							self.h_offset += 1;
						} else return self.h_error("Expected enum block", self.h_tokens[self.h_offset]);
						l_proc = true;
						l_sep = true;
						while (self.h_offset < self.h_length && l_proc) {
							var l__g1 = self.h_tokens[self.h_offset];
							switch (l__g1.__enumIndex__/* gml_token */) {
								case 26/* cub_close */:
									self.h_offset += 1;
									l_proc = false;
									break;
								case 5/* comma */:
									if (l_sep) {
										return self.h_error("Unexpected comma", self.h_tokens[self.h_offset]);
									} else {
										self.h_offset += 1;
										l_sep = true;
									}
									break;
								case 12/* ident */:
									if (l_sep) {
										self.h_offset += 1;
										var l__g3 = self.h_tokens[self.h_offset];
										if (l__g3.__enumIndex__/* gml_token */ == 20/* set_op */) {
											if (l__g3.h_op == -1) {
												self.h_offset += 1;
												if (self.h_build_expr(0)) return true;
											} else self.h_out_node = undefined;
										} else self.h_out_node = undefined;
										var l_ec = new gml_enum_ctr(l__g1.h_id, l__g1.h_d, self.h_out_node);
										array_push(l_e.h_ctr_list, l_ec);
										l_e.h_ctr_map.h_obj[$ l_ec.h_name] = l_ec;
										l_sep = false;
									} else return self.h_expect("a comma or a closing bracket", self.h_tokens[self.h_offset]);
									break;
								default: return self.h_expect("a comma, enum entry, or closing bracket", self.h_tokens[self.h_offset]);
							}
						}
						if (l_proc) return self.h_error("Unclosed enum-block", l_tk);
						array_push(self.h_enums, l_e);
						self.h_out_node = gml_node_block(l__g, []);
						break;
					case 4:
						if (self.h_build_expr(0)) return true;
						l_x1 = self.h_out_node;
						if (self.h_offset >= self.h_length) return self.h_error_at("Expected a then-expression", self.h_source.h_get_eof());
						var l__g1 = self.h_tokens[self.h_offset];
						if (l__g1.__enumIndex__/* gml_token */ == 11/* keyword */) {
							if (l__g1.h_kw == 5) self.h_offset += 1;
						}
						if (self.h_build_line()) return true;
						l_x2 = self.h_out_node;
						l_i = self.h_offset;
						if (self.h_offset < self.h_length) {
							var l__g1 = self.h_tokens[self.h_offset];
							if (l__g1.__enumIndex__/* gml_token */ == 11/* keyword */) {
								if (l__g1.h_kw == 6) {
									self.h_offset += 1;
									if (self.h_build_line()) return true;
									l_x = self.h_out_node;
								} else {
									self.h_offset = l_i;
									l_x = undefined;
								}
							} else {
								self.h_offset = l_i;
								l_x = undefined;
							}
						} else {
							self.h_offset = l_i;
							l_x = undefined;
						}
						self.h_out_node = gml_node_if_then(l__g, l_x1, l_x2, l_x);
						break;
					case 7:
						var l_d = l__g;
						if (self.h_build_expr(0)) return true;
						l_x1 = self.h_out_node;
						var l_cc = [];
						var l_c = undefined;
						if (self.h_offset >= self.h_length) {
							return self.h_error_at("Expected switch-block body", self.h_source.h_get_eof());
						} else if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 25/* cub_open */) {
							self.h_offset += 1;
						} else return self.h_error("Expected switch-block body", self.h_tokens[self.h_offset]);
						if (self.h_offset >= self.h_length) return self.h_error_at("Expected switch-block contents", self.h_source.h_get_eof());
						var l__g1 = self.h_tokens[self.h_offset];
						if (l__g1.__enumIndex__/* gml_token */ == 11/* keyword */) switch (l__g1.h_kw) {
							case 8: case 9: break;
							default: return self.h_expect("`case` or `default`", self.h_tokens[self.h_offset]);
						} else return self.h_expect("`case` or `default`", self.h_tokens[self.h_offset]);
						l_proc = true;
						l_x2 = undefined;
						l_nodes = undefined;
						var l_pre = [];
						while (self.h_offset < self.h_length && l_proc) {
							var l__g1 = self.h_tokens[self.h_offset];
							switch (l__g1.__enumIndex__/* gml_token */) {
								case 26/* cub_close */:
									self.h_offset += 1;
									l_proc = false;
									break;
								case 11/* keyword */:
									switch (l__g1.h_kw) {
										case 8:
											self.h_offset += 1;
											if (self.h_build_expr(0)) return true;
											if (self.h_offset >= self.h_length) {
												return self.h_error_at("Expected a colon", self.h_source.h_get_eof());
											} else if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 7/* colon */) {
												self.h_offset += 1;
											} else return self.h_error("Expected a colon", self.h_tokens[self.h_offset]);
											l_nodes = [self.h_out_node];
											while (self.h_offset < self.h_length) {
												var l__g5 = self.h_tokens[self.h_offset];
												if (l__g5.__enumIndex__/* gml_token */ == 11/* keyword */) {
													if (l__g5.h_kw == 8) {
														self.h_offset += 1;
														if (self.h_build_expr(0)) return true;
														if (self.h_offset >= self.h_length) {
															return self.h_error_at("Expected a colon", self.h_source.h_get_eof());
														} else if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 7/* colon */) {
															self.h_offset += 1;
														} else return self.h_error("Expected a colon", self.h_tokens[self.h_offset]);
														array_push(l_nodes, self.h_out_node);
														continue;
													}
												}
												break;
											}
											l_c = { values: l_nodes, expr: undefined, pre: l_pre }
											array_push(l_cc, l_c);
											l_nodes = [];
											l_pre = [];
											l_c.expr = gml_node_block(l__g1.h_d, l_nodes);
											break;
										case 9:
											self.h_offset += 1;
											if (self.h_offset >= self.h_length) {
												return self.h_error_at("Expected a colon", self.h_source.h_get_eof());
											} else if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 7/* colon */) {
												self.h_offset += 1;
											} else return self.h_error("Expected a colon", self.h_tokens[self.h_offset]);
											l_nodes = [];
											l_x2 = gml_node_block(l__g1.h_d, l_nodes);
											break;
										default:
											if (self.h_build_line()) return true;
											array_push(l_nodes, self.h_out_node);
									}
									break;
								default:
									if (self.h_build_line()) return true;
									array_push(l_nodes, self.h_out_node);
							}
						}
						if (l_proc) return self.h_error_at("Unclosed switch-block", l_d);
						self.h_out_node = gml_node_switch_hx(l_d, l_x1, l_cc, l_x2);
						break;
					case 14:
						var l_d = l__g;
						if (self.h_offset >= self.h_length) return self.h_error_at("Expected for-loop header", self.h_source.h_get_eof());
						if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 21/* par_open */) {
							self.h_offset += 1;
							l_proc = true;
						} else l_proc = false;
						if (self.h_offset >= self.h_length) return self.h_error_at("Expected for-loop init", self.h_source.h_get_eof());
						if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 4/* semico */) {
							self.h_offset += 1;
							l_x = gml_node_block(l_d, []);
						} else {
							if (self.h_build_line_inner(true)) return true;
							l_x = self.h_out_node;
							if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 4/* semico */) self.h_offset += 1;
						}
						if (self.h_offset >= self.h_length) return self.h_error_at("Expected for-loop condition", self.h_source.h_get_eof());
						if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 4/* semico */) {
							self.h_offset += 1;
							l_x1 = gml_node_boolean(l_d, true);
						} else {
							if (self.h_build_expr(0)) return true;
							l_x1 = self.h_out_node;
							if (self.h_offset >= self.h_length) return self.h_error_at("Expected for-loop post-action", self.h_source.h_get_eof());
							if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 4/* semico */) self.h_offset += 1;
						}
						if (self.h_offset >= self.h_length) return self.h_error_at("Expected for-loop post-action", self.h_source.h_get_eof());
						if (l_proc) {
							if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 22/* par_close */) {
								self.h_offset += 1;
								l_proc = false;
								l_x2 = gml_node_block(l_d, []);
							} else {
								if (self.h_build_line()) return true;
								l_x2 = self.h_out_node;
							}
						} else {
							if (self.h_build_line()) return true;
							l_x2 = self.h_out_node;
						}
						if (l_proc) {
							if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 22/* par_close */) self.h_offset += 1; else return self.h_expect("a closing parenthesis", self.h_tokens[self.h_offset]);
						}
						if (self.h_build_line()) return true;
						self.h_out_node = gml_node_for_hx(l_d, l_x, l_x1, l_x2, self.h_out_node);
						break;
					case 11:
						if (self.h_build_expr(0)) return true;
						l_x1 = self.h_out_node;
						if (self.h_build_line()) return true;
						self.h_out_node = gml_node_while_hx(l__g, l_x1, self.h_out_node);
						break;
					case 10:
						if (self.h_build_expr(0)) return true;
						l_x1 = self.h_out_node;
						if (self.h_build_line()) return true;
						self.h_out_node = gml_node_repeat_hx(l__g, l_x1, self.h_out_node);
						break;
					case 13:
						var l_d = l__g;
						if (self.h_build_line()) return true;
						l_x1 = self.h_out_node;
						if (self.h_offset >= self.h_length) return self.h_error_at("Expected a `while` or `until`", self.h_source.h_get_eof());
						var l__g1 = self.h_tokens[self.h_offset];
						if (l__g1.__enumIndex__/* gml_token */ == 11/* keyword */) switch (l__g1.h_kw) {
							case 11:
								self.h_offset += 1;
								if (self.h_build_expr(0)) return true;
								self.h_out_node = gml_node_do_while(l_d, l_x1, self.h_out_node);
								break;
							case 12:
								self.h_offset += 1;
								if (self.h_build_expr(0)) return true;
								self.h_out_node = gml_node_do_until(l_d, l_x1, self.h_out_node);
								break;
							default: return self.h_expect("a `while` or `until`", self.h_tokens[self.h_offset]);
						} else return self.h_expect("a `while` or `until`", self.h_tokens[self.h_offset]);
						break;
					case 15:
						if (self.h_build_expr(0)) return true;
						l_x1 = self.h_out_node;
						if (self.h_build_line()) return true;
						self.h_out_node = gml_node_with_hx(l__g, l_x1, self.h_out_node);
						break;
					case 17: self.h_out_node = gml_node_break_hx(l__g); break;
					case 16: self.h_out_node = gml_node_continue_hx(l__g); break;
					case 19: self.h_out_node = gml_node_exit_hx(l__g); break;
					case 18:
						var l_d = l__g;
						if (self.h_offset < self.h_length) {
							var l__g1 = self.h_tokens[self.h_offset];
							switch (l__g1.__enumIndex__/* gml_token */) {
								case 4/* semico */: self.h_out_node = gml_node_exit_hx(l__g1.h_d); break;
								case 26/* cub_close */: self.h_out_node = gml_node_exit_hx(l__g1.h_d); break;
								default:
									if (self.h_build_expr(0)) return true;
									self.h_out_node = gml_node_return_hx(l_d, self.h_out_node);
							}
						} else self.h_out_node = gml_node_exit_hx(l_d);
						break;
					case 29:
						if (self.h_build_expr(0)) return true;
						self.h_out_node = gml_node_delete_hx(l__g, self.h_out_node);
						break;
					case 20:
						if (self.h_build_expr(0)) return true;
						self.h_out_node = gml_node_wait(l__g, self.h_out_node);
						break;
					case 28: self.h_out_node = gml_node_debugger(l__g); break;
					case 21:
						if (self.h_build_line()) return true;
						l_x1 = self.h_out_node;
						if (self.h_offset >= self.h_length) {
							return self.h_error_at("Expected a catch-block", self.h_source.h_get_eof());
						} else {
							var l__g1 = self.h_tokens[self.h_offset];
							if (l__g1.__enumIndex__/* gml_token */ == 11/* keyword */) {
								if (l__g1.h_kw == 22) self.h_offset += 1; else return self.h_error("Expected a catch-block", self.h_tokens[self.h_offset]);
							} else return self.h_error("Expected a catch-block", self.h_tokens[self.h_offset]);
						}
						if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 21/* par_open */) {
							self.h_offset += 1;
							l_proc = true;
						} else l_proc = false;
						if (self.h_offset >= self.h_length) {
							return self.h_error_at("Expected a capture variable name", self.h_source.h_get_eof());
						} else {
							var l__g1 = self.h_tokens[self.h_offset];
							if (l__g1.__enumIndex__/* gml_token */ == 12/* ident */) {
								self.h_offset += 1;
								l_s = l__g1.h_id;
							} else return self.h_error("Expected a capture variable name", self.h_tokens[self.h_offset]);
						}
						if (l_proc) {
							if (self.h_offset >= self.h_length) {
								return self.h_error_at("Expected a closing parenthesis", self.h_source.h_get_eof());
							} else if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 22/* par_close */) {
								self.h_offset += 1;
							} else return self.h_error("Expected a closing parenthesis", self.h_tokens[self.h_offset]);
						}
						if (self.h_build_line()) return true;
						self.h_out_node = gml_node_try_catch(l__g, l_x1, l_s, self.h_out_node);
						break;
					case 23:
						if (self.h_build_expr(0)) return true;
						self.h_out_node = gml_node_throw_hx(l__g, self.h_out_node);
						break;
					default: l_unknown = true;
				}
				break;
			case 2/* macro_start */:
				var l__g = self.h_tokens[self.h_offset++];
				if (l__g.__enumIndex__/* gml_token */ == 12/* ident */) {
					var l_s1 = l__g.h_id;
					var l_add;
					if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 7/* colon */) {
						self.h_offset += 1;
						l_add = l_s1 == live_config;
						var l__g = self.h_tokens[self.h_offset++];
						if (l__g.__enumIndex__/* gml_token */ == 12/* ident */) l_s1 = l__g.h_id; else return self.h_error("Expected a macro name", self.h_tokens[self.h_offset]);
					} else l_add = true;
					if (self.h_build_line(false)) return true;
					if (l_add) {
						var l_i1 = gml_std_gml_internal_ArrayImpl_indexOf(self.h_macro_names, l_s1);
						if (l_i1 < 0) {
							l_i1 = array_length(self.h_macro_names);
							self.h_macro_names[@l_i1] = l_s1;
						}
						self.h_macro_nodes[@l_i1] = new gml_macro(l_s1, self.h_out_node, gml_builder_build_line_is_expr, gml_builder_build_line_is_stat);
					}
					self.h_out_node = gml_node_block(l_tk.h_d, []);
				} else return self.h_error("Expected a macro name", self.h_tokens[self.h_offset]);
				break;
			case 25/* cub_open */:
				var l_start = l_tk.h_d;
				if (!l_reqStatement) switch (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */) {
					case 16/* cstring */:
						self.h_offset -= 1;
						return self.h_build_expr(0);
					case 12/* ident */:
						if (self.h_offset + 1 < self.h_length) {
							if (self.h_tokens[self.h_offset + 1].__enumIndex__/* gml_token */ == 7/* colon */) {
								self.h_offset -= 1;
								return self.h_build_expr(0);
							}
						}
						break;
				}
				l_proc = true;
				l_nodes = [];
				while (l_proc && self.h_offset < self.h_length) {
					if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 26/* cub_close */) {
						self.h_offset += 1;
						l_proc = false;
					} else {
						if (self.h_build_line()) return true;
						array_push(l_nodes, self.h_out_node);
					}
				}
				if (l_proc) return self.h_error_at("Expected a closing bracket.", l_start);
				self.h_out_node = gml_node_block(l_start, l_nodes);
				break;
			case 12/* ident */:
				var l__g = l_tk.h_d;
				var l__g1 = l_tk.h_id;
				if (l__g1 == "static") {
					var l_d = l__g;
					var l__g2 = self.h_tokens[self.h_offset];
					if ((l__g2.__enumIndex__ == 12)) {
						l_nodes = [];
						l_proc = true;
						while (l_proc && self.h_offset < self.h_length) {
							l_tk2 = self.h_tokens[self.h_offset++];
							switch (l_tk2.__enumIndex__/* gml_token */) {
								case 11/* keyword */: if (l_tk2.h_kw == 2) var l_d1 = l_tk2.h_d; else return self.h_expect("a static variable name", l_tk2); break;
								case 12/* ident */:
									var l_id = l_tk2.h_id;
									if (self.h_offset >= self.h_length) return self.h_error_at("Expected a static variable value", self.h_source.h_get_eof());
									l_tk = self.h_tokens[self.h_offset];
									if (self.h_offset >= self.h_length) {
										return self.h_error_at("Expected a static variable value", self.h_source.h_get_eof());
									} else {
										var l__g2 = self.h_tokens[self.h_offset];
										if (l__g2.__enumIndex__/* gml_token */ == 20/* set_op */) {
											if (l__g2.h_op == -1) self.h_offset += 1; else return self.h_error("Expected a static variable value", self.h_tokens[self.h_offset]);
										} else return self.h_error("Expected a static variable value", self.h_tokens[self.h_offset]);
									}
									if (self.h_build_expr(0)) return true;
									array_push(l_nodes, gml_node_static_decl(l_tk2.h_d, l_id, self.h_out_node));
									var l_scr = self.h_current_script_ref;
									if (variable_struct_exists(l_scr.h_static_map.h_obj, l_id)) return self.h_error("Re-declaration of static variable " + l_id, l_tk2);
									l_scr.h_static_map.h_obj[$ l_id] = l_scr.h_static_count++;
									array_push(l_scr.h_static_values, undefined);
									array_push(l_scr.h_static_ready, false);
									if (self.h_offset < self.h_length) switch (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */) {
										case 5/* comma */: self.h_offset += 1; break;
										case 4/* semico */:
											self.h_offset += 1;
											l_proc = false;
											break;
										default: l_proc = false;
									}
									break;
								default: return self.h_expect("a static variable name", l_tk2);
							}
						}
						if (array_length(l_nodes) != 1) self.h_out_node = gml_node_block(l_d, l_nodes); else self.h_out_node = l_nodes[0];
					} else {
						var l_s = l__g1;
						var l_m = self.h_program.h_macro_map.h_obj[$ l_s];
						if (l_m != undefined && l_m.h_is_stat) {
							self.h_out_node = gml_node_tools_clone(l_m.h_node);
						} else {
							l_i = gml_std_gml_internal_ArrayImpl_indexOf(self.h_macro_names, l_s);
							if (l_i >= 0) {
								l_m = self.h_macro_nodes[l_i];
								if (l_m.h_is_stat) self.h_out_node = gml_node_tools_clone(l_m.h_node); else l_unknown = true;
							} else l_unknown = true;
						}
					}
				} else {
					var l_s = l__g1;
					var l_m = self.h_program.h_macro_map.h_obj[$ l_s];
					if (l_m != undefined && l_m.h_is_stat) {
						self.h_out_node = gml_node_tools_clone(l_m.h_node);
					} else {
						l_i = gml_std_gml_internal_ArrayImpl_indexOf(self.h_macro_names, l_s);
						if (l_i >= 0) {
							l_m = self.h_macro_nodes[l_i];
							if (l_m.h_is_stat) self.h_out_node = gml_node_tools_clone(l_m.h_node); else l_unknown = true;
						} else l_unknown = true;
					}
				}
				break;
			default: l_unknown = true;
		}
		if (l_unknown) {
			self.h_offset -= 1;
		} else {
			gml_builder_build_line_is_stat = true;
			gml_builder_build_line_is_expr = false;
		}
		if (l_unknown) {
			var l_flags = 4;
			if (l_reqStatement) l_flags |= 1;
			if (self.h_build_expr(l_flags)) return true;
			gml_builder_build_line_is_stat = gml_node_tools_is_statement(self.h_out_node);
			gml_builder_build_line_is_expr = true;
			if (l_reqStatement && !gml_builder_build_line_is_stat) return self.h_expect_node("a statement", self.h_out_node);
		}
		return false;
	}
	static h_build_line = function(l_reqStatement) {
		if (l_reqStatement == undefined) l_reqStatement = true;
		if (false) show_debug_message(argument[0]);
		if (self.h_build_line_inner(l_reqStatement)) return true;
		while (self.h_offset < self.h_length) {
			if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 4/* semico */) {
				self.h_offset += 1;
				continue;
			}
			break;
		}
		return false;
	}
	static h_build_top_level_script = function(l_name, l_namedArgs, l_namedArgc, l_isFunc, l_prefixStatements) {
		return self.h_build_top_level_script_body(self.h_add_script(l_name, l_namedArgs, l_namedArgc, l_isFunc, l_prefixStatements));
	}
	static h_add_script = function(l_name, l_namedArgs, l_namedArgc, l_isFunc, l_prefixStatements) {
		var l_pos;
		if (self.h_offset >= self.h_length) l_pos = self.h_source.h_get_eof(); else l_pos = self.h_tokens[self.h_offset].h_d;
		var l_scr = new gml_script(self.h_source, l_name, l_pos);
		if (l_namedArgs == undefined) l_namedArgs = new haxe_ds_string_map();
		l_scr.h_named_args = l_namedArgs;
		l_scr.h_arguments = l_namedArgc;
		l_scr.h_is_function = l_isFunc;
		l_scr.h_prefix_statements = l_prefixStatements;
		array_push(self.h_scripts, l_scr);
		return l_scr;
	}
	static h_build_top_level_script_body = function(l_scr) {
		var l_prefixStatements = l_scr.h_prefix_statements;
		l_scr.h_prefix_statements = undefined;
		var l__scriptName = self.h_current_script;
		var l__scriptRef = self.h_current_script_ref;
		self.h_current_script = l_scr.h_name;
		self.h_current_script_ref = l_scr;
		var l_nodes;
		if (l_scr.h_is_function) {
			if (self.h_build_line()) return true;
			var l_scrNode = self.h_out_node;
			if (l_prefixStatements != undefined) {
				array_push(l_prefixStatements, l_scrNode);
				l_scrNode = gml_node_block(gml_std_haxe_enum_tools_getParameter(l_scrNode, 0), l_prefixStatements);
			}
			l_scr.h_node = l_scrNode;
			l_scr = self.h_scripts[0];
			var l__g = l_scr.h_node;
			if (l__g.__enumIndex__/* gml_node */ == 93/* block */) l_nodes = l__g.h_nodes; else l_nodes = [l_scr.h_node];
		} else if (l_prefixStatements != undefined) {
			l_nodes = l_prefixStatements;
		} else l_nodes = [];
		while (self.h_offset < self.h_length) {
			var l__g = self.h_tokens[self.h_offset];
			switch (l__g.__enumIndex__/* gml_token */) {
				case 0/* header */: break;
				case 11/* keyword */:
					if (l__g.h_kw != 24) {
						if (self.h_build_line()) return true;
						array_push(l_nodes, self.h_out_node);
						continue;
					}
					break;
				default:
					if (self.h_build_line()) return true;
					array_push(l_nodes, self.h_out_node);
					continue;
			}
			break;
		}
		if (array_length(l_nodes) > 1) {
			l_scr.h_node = gml_node_block(gml_std_haxe_enum_tools_getParameter(l_nodes[0], 0), l_nodes);
		} else if (array_length(l_nodes) == 1) {
			l_scr.h_node = l_nodes[0];
		} else l_scr.h_node = gml_node_block(self.h_source.h_get_eof(), l_nodes);
		self.h_current_script = l__scriptName;
		self.h_current_script_ref = l__scriptRef;
		return false;
	}
	static h_build_script_args = function() {
		var l_nextArgs = new haxe_ds_string_map();
		var l_nextArgc = 0;
		var l_proc = true;
		var l_nextPrefix = undefined;
		if (self.h_offset >= self.h_length) return self.h_error_at("Expected script arguments", self.h_source.h_get_eof());
		var l__g = self.h_tokens[self.h_offset];
		if ((l__g.__enumIndex__ == 22)) {
			self.h_offset += 1;
		} else while (l_proc && self.h_offset < self.h_length) {
			var l__g = self.h_tokens[self.h_offset];
			if (l__g.__enumIndex__/* gml_token */ == 12/* ident */) {
				var l_argName = l__g.h_id;
				var l_nextArg = l_argName;
				if (variable_struct_exists(l_nextArgs.h_obj, l_nextArg)) return self.h_error("An argument named " + l_nextArg + " is already defined at position " + gml_std_Std_stringify(l_nextArgs.h_obj[$ l_nextArg]), self.h_tokens[self.h_offset]);
				var l_argIndex = l_nextArgc++;
				l_nextArgs.h_obj[$ l_argName] = l_argIndex;
				self.h_offset += 1;
				var l__g2 = self.h_tokens[self.h_offset];
				if (l__g2.__enumIndex__/* gml_token */ == 20/* set_op */) {
					if (l__g2.h_op == -1) {
						var l_defPos = l__g2.h_d;
						self.h_offset += 1;
						if (self.h_build_expr(0)) return true;
						var l_ifNode = gml_node_if_then(l_defPos, gml_node_bin_op(l_defPos, 64, gml_node_arg_const(l_defPos, l_argIndex), gml_node_undefined_hx(l_defPos)), gml_node_set_op(l_defPos, -1, gml_node_arg_const(l_defPos, l_argIndex), self.h_out_node), undefined);
						if (l_nextPrefix == undefined) l_nextPrefix = [];
						array_push(l_nextPrefix, l_ifNode);
					}
				}
				switch (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */) {
					case 22/* par_close */:
						self.h_offset += 1;
						l_proc = false;
						break;
					case 5/* comma */: self.h_offset += 1; break;
					default: return self.h_expect("a comma or closing parenthesis in script arguments", self.h_tokens[self.h_offset]);
				}
			} else return self.h_expect("an argument", self.h_tokens[self.h_offset]);
		}
		self.h_build_script_args_map = l_nextArgs;
		self.h_build_script_args_argc = l_nextArgc;
		self.h_build_script_args_prefix = l_nextPrefix;
		return false;
	}
	static h_build_script_args_prefix = undefined; /// @is {array<ast_GmlNode>}
	static h_build_script_args_map = undefined; /// @is {tools_Dictionary<int>}
	static h_build_script_args_argc = undefined; /// @is {int}
	static h_build_inherit = function() {
		if (self.h_offset >= self.h_length) return self.h_error_at("Expected a parent function name", self.h_source.h_get_eof());
		var l_tk = self.h_tokens[self.h_offset++];
		switch (l_tk.__enumIndex__/* gml_token */) {
			case 12/* ident */:
				self.h_build_inherit_is_global = false;
				self.h_build_inherit_parent = l_tk.h_id;
				break;
			case 11/* keyword */:
				if (l_tk.h_kw == 0) {
					if (self.h_offset >= self.h_length) {
						return self.h_error_at("Expected a `.` after `global.`", self.h_source.h_get_eof());
					} else if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 6/* period */) {
						self.h_offset += 1;
					} else return self.h_error("Expected a `.` after `global.`", self.h_tokens[self.h_offset]);
					if (self.h_offset >= self.h_length) {
						return self.h_error_at("Expected a global variable name", self.h_source.h_get_eof());
					} else {
						var l__g = self.h_tokens[self.h_offset];
						if (l__g.__enumIndex__/* gml_token */ == 12/* ident */) {
							self.h_offset += 1;
							self.h_build_inherit_is_global = true;
							self.h_build_inherit_parent = l__g.h_id;
						} else return self.h_error("Expected a global variable name", self.h_tokens[self.h_offset]);
					}
				} else return self.h_expect("a parent function name", l_tk);
				break;
			default: return self.h_expect("a parent function name", l_tk);
		}
		if (self.h_offset >= self.h_length) {
			return self.h_error_at("Expected an opening `(` for inheritance call", self.h_source.h_get_eof());
		} else if (self.h_tokens[self.h_offset].__enumIndex__/* gml_token */ == 21/* par_open */) {
			self.h_offset += 1;
		} else return self.h_error("Expected an opening `(` for inheritance call", self.h_tokens[self.h_offset]);
		if (self.h_build_script_args()) return true;
		return false;
	}
	static h_build_inherit_is_global = undefined; /// @is {bool}
	static h_build_inherit_parent = undefined; /// @is {string}
	static h_build_loop = function(l_first) {
		if (self.h_build_top_level_script(l_first, undefined, 0, false, undefined)) return true;
		var l_hasFirstFunc = false;
		while (self.h_offset < self.h_length) {
			var l_tk = self.h_tokens[self.h_offset];
			switch (l_tk.__enumIndex__/* gml_token */) {
				case 0/* header */:
					self.h_offset += 1;
					var l_nextName = l_tk.h_name;
					var l_nextArgs = undefined;
					var l_nextArgc = 0;
					var l_nextPrefix = undefined;
					if (!(l_tk.h_lb || self.h_offset >= self.h_length)) {
						var l__g1 = self.h_tokens[self.h_offset];
						if ((l__g1.__enumIndex__ == 21)) {
							self.h_offset += 1;
							if (self.h_build_script_args()) return true;
							l_nextArgs = self.h_build_script_args_map;
							l_nextArgc = self.h_build_script_args_argc;
							l_nextPrefix = self.h_build_script_args_prefix;
							self.h_build_script_args_map = undefined;
						}
					}
					if (self.h_build_top_level_script(l_nextName, l_nextArgs, l_nextArgc, false, l_nextPrefix)) return true;
					break;
				case 11/* keyword */:
					if (l_tk.h_kw == 24) {
						self.h_offset += 1;
						if (self.h_offset >= self.h_length) return self.h_error_at("Expected a function name", self.h_source.h_get_eof());
						var l_nextName1;
						l_tk = self.h_tokens[self.h_offset];
						if (l_tk.__enumIndex__/* gml_token */ == 12/* ident */) {
							l_nextName1 = l_tk.h_id;
							self.h_offset += 1;
						} else if (l_hasFirstFunc) {
							return self.h_expect("a function name", l_tk);
						} else {
							l_hasFirstFunc = true;
							l_nextName1 = l_first;
						}
						if (self.h_offset >= self.h_length) return self.h_error_at("Expected an opening `(`", self.h_source.h_get_eof());
						l_tk = self.h_tokens[self.h_offset++];
						if (!(l_tk.__enumIndex__ == 21)) return self.h_expect("an opening `(`", l_tk);
						if (self.h_build_script_args()) return true;
						var l_nextArgs1 = self.h_build_script_args_map;
						self.h_build_script_args_map = undefined;
						var l_scr = self.h_add_script(l_nextName1, l_nextArgs1, self.h_build_script_args_argc, true, self.h_build_script_args_prefix);
						if (self.h_offset < self.h_length) {
							l_tk = self.h_tokens[self.h_offset];
							if ((l_tk.__enumIndex__ == 7)) {
								self.h_offset += 1;
								l_scr.h_is_constructor = true;
								if (self.h_build_inherit()) return true;
								l_scr.h_parent_name = self.h_build_inherit_parent;
								l_scr.h_parent_is_global = self.h_build_inherit_is_global;
								l_scr.h_parent_argc = self.h_build_script_args_argc;
								self.h_build_script_args_map = undefined;
							} else {
								var l_tmp3;
								if (l_tk.__enumIndex__/* gml_token */ == 12/* ident */) l_tmp3 = l_tk.h_id == "constructor"; else l_tmp3 = false;
								if (l_tmp3) {
									self.h_offset += 1;
									l_scr.h_is_constructor = true;
								}
							}
						}
						if (self.h_build_top_level_script_body(l_scr)) return true;
					} else return self.h_expect("A script declaration", l_tk);
					break;
				default: return self.h_expect("A script declaration", l_tk);
			}
		}
		return false;
	}
	static h_program = undefined; /// @is {gml_program}
	static h_dump = function() {
		var l_i = 0;
		for (var l__g1 = self.h_length; l_i < l__g1; l_i++) {
			var l_tmp = string(l_i) + "\t";
			var l_q = self.h_tokens[l_i];
			var l_n = gml_std_haxe_enum_tools_getParameterCount(l_q);
			var l_r = gml_std_Type_enumConstructor(l_q) + "(" + l_q.h_d.h_to_string();
			var l_i1 = 1;
			for (var l__g3 = l_n; l_i1 < l__g3; l_i1++) {
				l_r += ", " + gml_std_Std_stringify(gml_std_haxe_enum_tools_getParameter(l_q, l_i1));
			}
			show_debug_message(l_tmp + (l_r + ")"));
		}
	}
	self.h_build_inherit_parent = undefined;
	self.h_build_inherit_is_global = false;
	self.h_build_script_args_argc = 0;
	self.h_build_script_args_map = undefined;
	self.h_build_script_args_prefix = [];
	self.h_current_script_ref = undefined;
	self.h_current_script = undefined;
	self.h_error_text = undefined;
	self.h_global_vars = [];
	self.h_macro_nodes = [];
	self.h_macro_names = [];
	self.h_enums = [];
	self.h_scripts = [];
	self.h_offset = 0;
	self.h_program = l_pg;
	self.h_source = l_src;
	var l_parser = l_src.h_parser;
	if (l_parser != undefined && l_parser.h_tokens != undefined) {
		self.h_tokens = l_parser.h_tokens;
		self.h_length = l_parser.h_token_count;
	} else {
		l_parser = new gml_parser(l_src);
		l_src.h_parser = l_parser;
		self.h_tokens = l_parser.h_run();
		if (self.h_tokens != undefined) {
			self.h_length = l_parser.h_token_count;
		} else {
			self.h_error_text = gml_parser_error_text;
			self.h_error_pos = gml_parser_error_pos;
		}
	}
	static __class__ = mt_gml_builder;
}

#endregion
