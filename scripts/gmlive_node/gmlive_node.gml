// GMLive.gml (c) YellowAfterlife, 2017+
// PLEASE DO NOT FORGET to remove paid extensions from your project when publishing the source code!
// And if you are using git, you can exclude GMLive by adding
// `scripts/GMLive*` and `extensions/GMLive/` lines to your `.gitignore`.
// Feather disable all

// AST nodes
#region gml.node

if (live_enabled) /// @interface {gml_node}
function mc_gml_node() constructor {
	/// @hint {array} gml_node:__enumParams__
	/// @hint {int} gml_node:__enumIndex__
	static getIndex = method(undefined, gml_std_enum_getIndex);
	static toString = method(undefined, gml_std_enum_toString);
	static __enum__ = mt_gml_node;
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_undefined_hx() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	static __enumParams__ = ["h_d"];
	static __enumIndex__ = 0;
}

if (live_enabled) 
function gml_node_undefined_hx(l_h_d) {
	var l_this = new mc_gml_node_undefined_hx();
	l_this.h_d = l_h_d;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_boolean() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {bool} :h_value
	static __enumParams__ = ["h_d", "h_value"];
	static __enumIndex__ = 1;
}

if (live_enabled) 
function gml_node_boolean(l_h_d, l_h_value) {
	var l_this = new mc_gml_node_boolean();
	l_this.h_d = l_h_d;
	l_this.h_value = l_h_value;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_number() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {number} :h_value
	/// @hint {string} :h_src
	static __enumParams__ = ["h_d", "h_value", "h_src"];
	static __enumIndex__ = 2;
}

if (live_enabled) 
function gml_node_number(l_h_d, l_h_value, l_h_src) {
	var l_this = new mc_gml_node_number();
	l_this.h_d = l_h_d;
	l_this.h_value = l_h_value;
	l_this.h_src = l_h_src;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_cstring() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {string} :h_value
	static __enumParams__ = ["h_d", "h_value"];
	static __enumIndex__ = 3;
}

if (live_enabled) 
function gml_node_cstring(l_h_d, l_h_value) {
	var l_this = new mc_gml_node_cstring();
	l_this.h_d = l_h_d;
	l_this.h_value = l_h_value;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_other_const() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {any} :h_value
	static __enumParams__ = ["h_d", "h_value"];
	static __enumIndex__ = 4;
}

if (live_enabled) 
function gml_node_other_const(l_h_d, l_h_value) {
	var l_this = new mc_gml_node_other_const();
	l_this.h_d = l_h_d;
	l_this.h_value = l_h_value;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_enum_ctr() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {gml_enum} :h_e
	/// @hint {gml_enum_ctr} :h_ctr
	static __enumParams__ = ["h_d", "h_e", "h_ctr"];
	static __enumIndex__ = 5;
}

if (live_enabled) 
function gml_node_enum_ctr(l_h_d, l_h_e, l_h_ctr) {
	var l_this = new mc_gml_node_enum_ctr();
	l_this.h_d = l_h_d;
	l_this.h_e = l_h_e;
	l_this.h_ctr = l_h_ctr;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_array_decl() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {array<ast_GmlNode>} :h_values
	static __enumParams__ = ["h_d", "h_values"];
	static __enumIndex__ = 6;
}

if (live_enabled) 
function gml_node_array_decl(l_h_d, l_h_values) {
	var l_this = new mc_gml_node_array_decl();
	l_this.h_d = l_h_d;
	l_this.h_values = l_h_values;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_object_decl() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {array<string>} :h_keys
	/// @hint {array<ast_GmlNode>} :h_values
	static __enumParams__ = ["h_d", "h_keys", "h_values"];
	static __enumIndex__ = 7;
}

if (live_enabled) 
function gml_node_object_decl(l_h_d, l_h_keys, l_h_values) {
	var l_this = new mc_gml_node_object_decl();
	l_this.h_d = l_h_d;
	l_this.h_keys = l_h_keys;
	l_this.h_values = l_h_values;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_ensure_array_for_local() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {string} :h_name
	static __enumParams__ = ["h_d", "h_name"];
	static __enumIndex__ = 8;
}

if (live_enabled) 
function gml_node_ensure_array_for_local(l_h_d, l_h_name) {
	var l_this = new mc_gml_node_ensure_array_for_local();
	l_this.h_d = l_h_d;
	l_this.h_name = l_h_name;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_ensure_array_for_global() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {string} :h_name
	static __enumParams__ = ["h_d", "h_name"];
	static __enumIndex__ = 9;
}

if (live_enabled) 
function gml_node_ensure_array_for_global(l_h_d, l_h_name) {
	var l_this = new mc_gml_node_ensure_array_for_global();
	l_this.h_d = l_h_d;
	l_this.h_name = l_h_name;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_ensure_array_for_field() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_obj
	/// @hint {string} :h_fd
	static __enumParams__ = ["h_d", "h_obj", "h_fd"];
	static __enumIndex__ = 10;
}

if (live_enabled) 
function gml_node_ensure_array_for_field(l_h_d, l_h_obj, l_h_fd) {
	var l_this = new mc_gml_node_ensure_array_for_field();
	l_this.h_d = l_h_d;
	l_this.h_obj = l_h_obj;
	l_this.h_fd = l_h_fd;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_ensure_array_for_index() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_arr
	/// @hint {ast_GmlNode} :h_ind
	static __enumParams__ = ["h_d", "h_arr", "h_ind"];
	static __enumIndex__ = 11;
}

if (live_enabled) 
function gml_node_ensure_array_for_index(l_h_d, l_h_arr, l_h_ind) {
	var l_this = new mc_gml_node_ensure_array_for_index();
	l_this.h_d = l_h_d;
	l_this.h_arr = l_h_arr;
	l_this.h_ind = l_h_ind;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_ensure_array_for_index2d() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_arr
	/// @hint {ast_GmlNode} :h_ind1
	/// @hint {ast_GmlNode} :h_ind2
	static __enumParams__ = ["h_d", "h_arr", "h_ind1", "h_ind2"];
	static __enumIndex__ = 12;
}

if (live_enabled) 
function gml_node_ensure_array_for_index2d(l_h_d, l_h_arr, l_h_ind1, l_h_ind2) {
	var l_this = new mc_gml_node_ensure_array_for_index2d();
	l_this.h_d = l_h_d;
	l_this.h_arr = l_h_arr;
	l_this.h_ind1 = l_h_ind1;
	l_this.h_ind2 = l_h_ind2;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_ident() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {string} :h_id
	static __enumParams__ = ["h_d", "h_id"];
	static __enumIndex__ = 13;
}

if (live_enabled) 
function gml_node_ident(l_h_d, l_h_id) {
	var l_this = new mc_gml_node_ident();
	l_this.h_d = l_h_d;
	l_this.h_id = l_h_id;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_self_hx() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	static __enumParams__ = ["h_d"];
	static __enumIndex__ = 14;
}

if (live_enabled) 
function gml_node_self_hx(l_h_d) {
	var l_this = new mc_gml_node_self_hx();
	l_this.h_d = l_h_d;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_other_hx() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	static __enumParams__ = ["h_d"];
	static __enumIndex__ = 15;
}

if (live_enabled) 
function gml_node_other_hx(l_h_d) {
	var l_this = new mc_gml_node_other_hx();
	l_this.h_d = l_h_d;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_global_ref() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	static __enumParams__ = ["h_d"];
	static __enumIndex__ = 16;
}

if (live_enabled) 
function gml_node_global_ref(l_h_d) {
	var l_this = new mc_gml_node_global_ref();
	l_this.h_d = l_h_d;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_script() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {gml_script} :h_ref
	static __enumParams__ = ["h_d", "h_ref"];
	static __enumIndex__ = 17;
}

if (live_enabled) 
function gml_node_script(l_h_d, l_h_ref) {
	var l_this = new mc_gml_node_script();
	l_this.h_d = l_h_d;
	l_this.h_ref = l_h_ref;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_native_script() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {string} :h_name
	/// @hint {script} :h_id
	static __enumParams__ = ["h_d", "h_name", "h_id"];
	static __enumIndex__ = 18;
}

if (live_enabled) 
function gml_node_native_script(l_h_d, l_h_name, l_h_id) {
	var l_this = new mc_gml_node_native_script();
	l_this.h_d = l_h_d;
	l_this.h_name = l_h_name;
	l_this.h_id = l_h_id;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_const() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {string} :h_name
	static __enumParams__ = ["h_d", "h_name"];
	static __enumIndex__ = 19;
}

if (live_enabled) 
function gml_node_const(l_h_d, l_h_name) {
	var l_this = new mc_gml_node_const();
	l_this.h_d = l_h_d;
	l_this.h_name = l_h_name;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_arg_const() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {int} :h_index
	static __enumParams__ = ["h_d", "h_index"];
	static __enumIndex__ = 20;
}

if (live_enabled) 
function gml_node_arg_const(l_h_d, l_h_index) {
	var l_this = new mc_gml_node_arg_const();
	l_this.h_d = l_h_d;
	l_this.h_index = l_h_index;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_arg_index() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_index
	static __enumParams__ = ["h_d", "h_index"];
	static __enumIndex__ = 21;
}

if (live_enabled) 
function gml_node_arg_index(l_h_d, l_h_index) {
	var l_this = new mc_gml_node_arg_index();
	l_this.h_d = l_h_d;
	l_this.h_index = l_h_index;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_arg_count() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	static __enumParams__ = ["h_d"];
	static __enumIndex__ = 22;
}

if (live_enabled) 
function gml_node_arg_count(l_h_d) {
	var l_this = new mc_gml_node_arg_count();
	l_this.h_d = l_h_d;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_call() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_expr
	/// @hint {array<ast_GmlNode>} :h_args
	static __enumParams__ = ["h_d", "h_expr", "h_args"];
	static __enumIndex__ = 23;
}

if (live_enabled) 
function gml_node_call(l_h_d, l_h_expr, l_h_args) {
	var l_this = new mc_gml_node_call();
	l_this.h_d = l_h_d;
	l_this.h_expr = l_h_expr;
	l_this.h_args = l_h_args;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_call_script() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {string} :h_name
	/// @hint {array<ast_GmlNode>} :h_args
	static __enumParams__ = ["h_d", "h_name", "h_args"];
	static __enumIndex__ = 24;
}

if (live_enabled) 
function gml_node_call_script(l_h_d, l_h_name, l_h_args) {
	var l_this = new mc_gml_node_call_script();
	l_this.h_d = l_h_d;
	l_this.h_name = l_h_name;
	l_this.h_args = l_h_args;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_call_script_at() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_inst
	/// @hint {string} :h_script
	/// @hint {array<ast_GmlNode>} :h_args
	static __enumParams__ = ["h_d", "h_inst", "h_script", "h_args"];
	static __enumIndex__ = 25;
}

if (live_enabled) 
function gml_node_call_script_at(l_h_d, l_h_inst, l_h_script, l_h_args) {
	var l_this = new mc_gml_node_call_script_at();
	l_this.h_d = l_h_d;
	l_this.h_inst = l_h_inst;
	l_this.h_script = l_h_script;
	l_this.h_args = l_h_args;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_call_script_id() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_index
	/// @hint {array<ast_GmlNode>} :h_args
	static __enumParams__ = ["h_d", "h_index", "h_args"];
	static __enumIndex__ = 26;
}

if (live_enabled) 
function gml_node_call_script_id(l_h_d, l_h_index, l_h_args) {
	var l_this = new mc_gml_node_call_script_id();
	l_this.h_d = l_h_d;
	l_this.h_index = l_h_index;
	l_this.h_args = l_h_args;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_call_script_with_array() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_index
	/// @hint {ast_GmlNode} :h_array
	static __enumParams__ = ["h_d", "h_index", "h_array"];
	static __enumIndex__ = 27;
}

if (live_enabled) 
function gml_node_call_script_with_array(l_h_d, l_h_index, l_h_array) {
	var l_this = new mc_gml_node_call_script_with_array();
	l_this.h_d = l_h_d;
	l_this.h_index = l_h_index;
	l_this.h_array = l_h_array;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_call_field() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_obj
	/// @hint {string} :h_field
	/// @hint {array<ast_GmlNode>} :h_args
	static __enumParams__ = ["h_d", "h_obj", "h_field", "h_args"];
	static __enumIndex__ = 28;
}

if (live_enabled) 
function gml_node_call_field(l_h_d, l_h_obj, l_h_field, l_h_args) {
	var l_this = new mc_gml_node_call_field();
	l_this.h_d = l_h_d;
	l_this.h_obj = l_h_obj;
	l_this.h_field = l_h_field;
	l_this.h_args = l_h_args;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_call_func() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {gml_func} :h_func
	/// @hint {array<ast_GmlNode>} :h_args
	static __enumParams__ = ["h_d", "h_func", "h_args"];
	static __enumIndex__ = 29;
}

if (live_enabled) 
function gml_node_call_func(l_h_d, l_h_func, l_h_args) {
	var l_this = new mc_gml_node_call_func();
	l_this.h_d = l_h_d;
	l_this.h_func = l_h_func;
	l_this.h_args = l_h_args;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_call_func_at() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_expr
	/// @hint {string} :h_fname
	/// @hint {array<ast_GmlNode>} :h_args
	static __enumParams__ = ["h_d", "h_expr", "h_fname", "h_args"];
	static __enumIndex__ = 30;
}

if (live_enabled) 
function gml_node_call_func_at(l_h_d, l_h_expr, l_h_fname, l_h_args) {
	var l_this = new mc_gml_node_call_func_at();
	l_this.h_d = l_h_d;
	l_this.h_expr = l_h_expr;
	l_this.h_fname = l_h_fname;
	l_this.h_args = l_h_args;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_construct() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_ctr
	/// @hint {array<ast_GmlNode>} :h_args
	static __enumParams__ = ["h_d", "h_ctr", "h_args"];
	static __enumIndex__ = 31;
}

if (live_enabled) 
function gml_node_construct(l_h_d, l_h_ctr, l_h_args) {
	var l_this = new mc_gml_node_construct();
	l_this.h_d = l_h_d;
	l_this.h_ctr = l_h_ctr;
	l_this.h_args = l_h_args;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_func_literal() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {string} :h_name
	static __enumParams__ = ["h_d", "h_name"];
	static __enumIndex__ = 32;
}

if (live_enabled) 
function gml_node_func_literal(l_h_d, l_h_name) {
	var l_this = new mc_gml_node_func_literal();
	l_this.h_d = l_h_d;
	l_this.h_name = l_h_name;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_prefix() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_expr
	/// @hint {bool} :h_inc
	static __enumParams__ = ["h_d", "h_expr", "h_inc"];
	static __enumIndex__ = 33;
}

if (live_enabled) 
function gml_node_prefix(l_h_d, l_h_expr, l_h_inc) {
	var l_this = new mc_gml_node_prefix();
	l_this.h_d = l_h_d;
	l_this.h_expr = l_h_expr;
	l_this.h_inc = l_h_inc;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_postfix() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_expr
	/// @hint {bool} :h_inc
	static __enumParams__ = ["h_d", "h_expr", "h_inc"];
	static __enumIndex__ = 34;
}

if (live_enabled) 
function gml_node_postfix(l_h_d, l_h_expr, l_h_inc) {
	var l_this = new mc_gml_node_postfix();
	l_this.h_d = l_h_d;
	l_this.h_expr = l_h_expr;
	l_this.h_inc = l_h_inc;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_un_op() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_expr
	/// @hint {ast_GmlUnOp} :h_op
	static __enumParams__ = ["h_d", "h_expr", "h_op"];
	static __enumIndex__ = 35;
}

if (live_enabled) 
function gml_node_un_op(l_h_d, l_h_expr, l_h_op) {
	var l_this = new mc_gml_node_un_op();
	l_this.h_d = l_h_d;
	l_this.h_expr = l_h_expr;
	l_this.h_op = l_h_op;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_bin_op() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {gml_op} :h_op
	/// @hint {ast_GmlNode} :h_a
	/// @hint {ast_GmlNode} :h_b
	static __enumParams__ = ["h_d", "h_op", "h_a", "h_b"];
	static __enumIndex__ = 36;
}

if (live_enabled) 
function gml_node_bin_op(l_h_d, l_h_op, l_h_a, l_h_b) {
	var l_this = new mc_gml_node_bin_op();
	l_this.h_d = l_h_d;
	l_this.h_op = l_h_op;
	l_this.h_a = l_h_a;
	l_this.h_b = l_h_b;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_set_op() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {gml_op} :h_op
	/// @hint {ast_GmlNode} :h_a
	/// @hint {ast_GmlNode} :h_b
	static __enumParams__ = ["h_d", "h_op", "h_a", "h_b"];
	static __enumIndex__ = 37;
}

if (live_enabled) 
function gml_node_set_op(l_h_d, l_h_op, l_h_a, l_h_b) {
	var l_this = new mc_gml_node_set_op();
	l_this.h_d = l_h_d;
	l_this.h_op = l_h_op;
	l_this.h_a = l_h_a;
	l_this.h_b = l_h_b;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_delete_hx() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_expr
	static __enumParams__ = ["h_d", "h_expr"];
	static __enumIndex__ = 38;
}

if (live_enabled) 
function gml_node_delete_hx(l_h_d, l_h_expr) {
	var l_this = new mc_gml_node_delete_hx();
	l_this.h_d = l_h_d;
	l_this.h_expr = l_h_expr;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_null_co() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_a
	/// @hint {ast_GmlNode} :h_b
	static __enumParams__ = ["h_d", "h_a", "h_b"];
	static __enumIndex__ = 39;
}

if (live_enabled) 
function gml_node_null_co(l_h_d, l_h_a, l_h_b) {
	var l_this = new mc_gml_node_null_co();
	l_this.h_d = l_h_d;
	l_this.h_a = l_h_a;
	l_this.h_b = l_h_b;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_to_bool() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_val"];
	static __enumIndex__ = 40;
}

if (live_enabled) 
function gml_node_to_bool(l_h_d, l_h_val) {
	var l_this = new mc_gml_node_to_bool();
	l_this.h_d = l_h_d;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_from_bool() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_val"];
	static __enumIndex__ = 41;
}

if (live_enabled) 
function gml_node_from_bool(l_h_d, l_h_val) {
	var l_this = new mc_gml_node_from_bool();
	l_this.h_d = l_h_d;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_in() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_fd
	/// @hint {ast_GmlNode} :h_obj
	/// @hint {bool} :h_not
	static __enumParams__ = ["h_d", "h_fd", "h_obj", "h_not"];
	static __enumIndex__ = 42;
}

if (live_enabled) 
function gml_node_in(l_h_d, l_h_fd, l_h_obj, l_h_not) {
	var l_this = new mc_gml_node_in();
	l_this.h_d = l_h_d;
	l_this.h_fd = l_h_fd;
	l_this.h_obj = l_h_obj;
	l_this.h_not = l_h_not;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_local_hx() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {string} :h_name
	static __enumParams__ = ["h_d", "h_name"];
	static __enumIndex__ = 43;
}

if (live_enabled) 
function gml_node_local_hx(l_h_d, l_h_name) {
	var l_this = new mc_gml_node_local_hx();
	l_this.h_d = l_h_d;
	l_this.h_name = l_h_name;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_local_set() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {string} :h_name
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_name", "h_val"];
	static __enumIndex__ = 44;
}

if (live_enabled) 
function gml_node_local_set(l_h_d, l_h_name, l_h_val) {
	var l_this = new mc_gml_node_local_set();
	l_this.h_d = l_h_d;
	l_this.h_name = l_h_name;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_local_aop() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {string} :h_name
	/// @hint {gml_op} :h_op
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_name", "h_op", "h_val"];
	static __enumIndex__ = 45;
}

if (live_enabled) 
function gml_node_local_aop(l_h_d, l_h_name, l_h_op, l_h_val) {
	var l_this = new mc_gml_node_local_aop();
	l_this.h_d = l_h_d;
	l_this.h_name = l_h_name;
	l_this.h_op = l_h_op;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_static_decl() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {string} :h_name
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_name", "h_val"];
	static __enumIndex__ = 46;
}

if (live_enabled) 
function gml_node_static_decl(l_h_d, l_h_name, l_h_val) {
	var l_this = new mc_gml_node_static_decl();
	l_this.h_d = l_h_d;
	l_this.h_name = l_h_name;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_static() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {string} :h_name
	static __enumParams__ = ["h_d", "h_name"];
	static __enumIndex__ = 47;
}

if (live_enabled) 
function gml_node_static(l_h_d, l_h_name) {
	var l_this = new mc_gml_node_static();
	l_this.h_d = l_h_d;
	l_this.h_name = l_h_name;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_static_set() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {string} :h_name
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_name", "h_val"];
	static __enumIndex__ = 48;
}

if (live_enabled) 
function gml_node_static_set(l_h_d, l_h_name, l_h_val) {
	var l_this = new mc_gml_node_static_set();
	l_this.h_d = l_h_d;
	l_this.h_name = l_h_name;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_static_aop() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {string} :h_name
	/// @hint {gml_op} :h_op
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_name", "h_op", "h_val"];
	static __enumIndex__ = 49;
}

if (live_enabled) 
function gml_node_static_aop(l_h_d, l_h_name, l_h_op, l_h_val) {
	var l_this = new mc_gml_node_static_aop();
	l_this.h_d = l_h_d;
	l_this.h_name = l_h_name;
	l_this.h_op = l_h_op;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_global_hx() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {string} :h_name
	static __enumParams__ = ["h_d", "h_name"];
	static __enumIndex__ = 50;
}

if (live_enabled) 
function gml_node_global_hx(l_h_d, l_h_name) {
	var l_this = new mc_gml_node_global_hx();
	l_this.h_d = l_h_d;
	l_this.h_name = l_h_name;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_global_set() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {string} :h_name
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_name", "h_val"];
	static __enumIndex__ = 51;
}

if (live_enabled) 
function gml_node_global_set(l_h_d, l_h_name, l_h_val) {
	var l_this = new mc_gml_node_global_set();
	l_this.h_d = l_h_d;
	l_this.h_name = l_h_name;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_global_aop() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {string} :h_name
	/// @hint {gml_op} :h_op
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_name", "h_op", "h_val"];
	static __enumIndex__ = 52;
}

if (live_enabled) 
function gml_node_global_aop(l_h_d, l_h_name, l_h_op, l_h_val) {
	var l_this = new mc_gml_node_global_aop();
	l_this.h_d = l_h_d;
	l_this.h_name = l_h_name;
	l_this.h_op = l_h_op;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_field() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_obj
	/// @hint {string} :h_field
	static __enumParams__ = ["h_d", "h_obj", "h_field"];
	static __enumIndex__ = 53;
}

if (live_enabled) 
function gml_node_field(l_h_d, l_h_obj, l_h_field) {
	var l_this = new mc_gml_node_field();
	l_this.h_d = l_h_d;
	l_this.h_obj = l_h_obj;
	l_this.h_field = l_h_field;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_field_set() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_obj
	/// @hint {string} :h_field
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_obj", "h_field", "h_val"];
	static __enumIndex__ = 54;
}

if (live_enabled) 
function gml_node_field_set(l_h_d, l_h_obj, l_h_field, l_h_val) {
	var l_this = new mc_gml_node_field_set();
	l_this.h_d = l_h_d;
	l_this.h_obj = l_h_obj;
	l_this.h_field = l_h_field;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_field_aop() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_obj
	/// @hint {string} :h_field
	/// @hint {gml_op} :h_op
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_obj", "h_field", "h_op", "h_val"];
	static __enumIndex__ = 55;
}

if (live_enabled) 
function gml_node_field_aop(l_h_d, l_h_obj, l_h_field, l_h_op, l_h_val) {
	var l_this = new mc_gml_node_field_aop();
	l_this.h_d = l_h_d;
	l_this.h_obj = l_h_obj;
	l_this.h_field = l_h_field;
	l_this.h_op = l_h_op;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_env() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {api_api_var} :h_v
	static __enumParams__ = ["h_d", "h_v"];
	static __enumIndex__ = 56;
}

if (live_enabled) 
function gml_node_env(l_h_d, l_h_v) {
	var l_this = new mc_gml_node_env();
	l_this.h_d = l_h_d;
	l_this.h_v = l_h_v;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_env_set() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {api_api_var} :h_v
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_v", "h_val"];
	static __enumIndex__ = 57;
}

if (live_enabled) 
function gml_node_env_set(l_h_d, l_h_v, l_h_val) {
	var l_this = new mc_gml_node_env_set();
	l_this.h_d = l_h_d;
	l_this.h_v = l_h_v;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_env_aop() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {api_api_var} :h_v
	/// @hint {gml_op} :h_op
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_v", "h_op", "h_val"];
	static __enumIndex__ = 58;
}

if (live_enabled) 
function gml_node_env_aop(l_h_d, l_h_v, l_h_op, l_h_val) {
	var l_this = new mc_gml_node_env_aop();
	l_this.h_d = l_h_d;
	l_this.h_v = l_h_v;
	l_this.h_op = l_h_op;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_env_fd() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_obj
	/// @hint {api_api_var} :h_v
	static __enumParams__ = ["h_d", "h_obj", "h_v"];
	static __enumIndex__ = 59;
}

if (live_enabled) 
function gml_node_env_fd(l_h_d, l_h_obj, l_h_v) {
	var l_this = new mc_gml_node_env_fd();
	l_this.h_d = l_h_d;
	l_this.h_obj = l_h_obj;
	l_this.h_v = l_h_v;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_env_fd_set() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_obj
	/// @hint {api_api_var} :h_v
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_obj", "h_v", "h_val"];
	static __enumIndex__ = 60;
}

if (live_enabled) 
function gml_node_env_fd_set(l_h_d, l_h_obj, l_h_v, l_h_val) {
	var l_this = new mc_gml_node_env_fd_set();
	l_this.h_d = l_h_d;
	l_this.h_obj = l_h_obj;
	l_this.h_v = l_h_v;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_env_fd_aop() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_obj
	/// @hint {api_api_var} :h_v
	/// @hint {gml_op} :h_op
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_obj", "h_v", "h_op", "h_val"];
	static __enumIndex__ = 61;
}

if (live_enabled) 
function gml_node_env_fd_aop(l_h_d, l_h_obj, l_h_v, l_h_op, l_h_val) {
	var l_this = new mc_gml_node_env_fd_aop();
	l_this.h_d = l_h_d;
	l_this.h_obj = l_h_obj;
	l_this.h_v = l_h_v;
	l_this.h_op = l_h_op;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_env1d() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {api_api_var} :h_v
	/// @hint {ast_GmlNode} :h_index
	static __enumParams__ = ["h_d", "h_v", "h_index"];
	static __enumIndex__ = 62;
}

if (live_enabled) 
function gml_node_env1d(l_h_d, l_h_v, l_h_index) {
	var l_this = new mc_gml_node_env1d();
	l_this.h_d = l_h_d;
	l_this.h_v = l_h_v;
	l_this.h_index = l_h_index;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_env1d_set() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {api_api_var} :h_v
	/// @hint {ast_GmlNode} :h_index
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_v", "h_index", "h_val"];
	static __enumIndex__ = 63;
}

if (live_enabled) 
function gml_node_env1d_set(l_h_d, l_h_v, l_h_index, l_h_val) {
	var l_this = new mc_gml_node_env1d_set();
	l_this.h_d = l_h_d;
	l_this.h_v = l_h_v;
	l_this.h_index = l_h_index;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_env1d_aop() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {api_api_var} :h_v
	/// @hint {ast_GmlNode} :h_index
	/// @hint {gml_op} :h_op
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_v", "h_index", "h_op", "h_val"];
	static __enumIndex__ = 64;
}

if (live_enabled) 
function gml_node_env1d_aop(l_h_d, l_h_v, l_h_index, l_h_op, l_h_val) {
	var l_this = new mc_gml_node_env1d_aop();
	l_this.h_d = l_h_d;
	l_this.h_v = l_h_v;
	l_this.h_index = l_h_index;
	l_this.h_op = l_h_op;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_alarm() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_obj
	/// @hint {ast_GmlNode} :h_index
	static __enumParams__ = ["h_d", "h_obj", "h_index"];
	static __enumIndex__ = 65;
}

if (live_enabled) 
function gml_node_alarm(l_h_d, l_h_obj, l_h_index) {
	var l_this = new mc_gml_node_alarm();
	l_this.h_d = l_h_d;
	l_this.h_obj = l_h_obj;
	l_this.h_index = l_h_index;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_alarm_set_hx() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_obj
	/// @hint {ast_GmlNode} :h_index
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_obj", "h_index", "h_val"];
	static __enumIndex__ = 66;
}

if (live_enabled) 
function gml_node_alarm_set_hx(l_h_d, l_h_obj, l_h_index, l_h_val) {
	var l_this = new mc_gml_node_alarm_set_hx();
	l_this.h_d = l_h_d;
	l_this.h_obj = l_h_obj;
	l_this.h_index = l_h_index;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_alarm_aop() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_obj
	/// @hint {ast_GmlNode} :h_index
	/// @hint {gml_op} :h_op
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_obj", "h_index", "h_op", "h_val"];
	static __enumIndex__ = 67;
}

if (live_enabled) 
function gml_node_alarm_aop(l_h_d, l_h_obj, l_h_index, l_h_op, l_h_val) {
	var l_this = new mc_gml_node_alarm_aop();
	l_this.h_d = l_h_d;
	l_this.h_obj = l_h_obj;
	l_this.h_index = l_h_index;
	l_this.h_op = l_h_op;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_index() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_arr
	/// @hint {ast_GmlNode} :h_index
	static __enumParams__ = ["h_d", "h_arr", "h_index"];
	static __enumIndex__ = 68;
}

if (live_enabled) 
function gml_node_index(l_h_d, l_h_arr, l_h_index) {
	var l_this = new mc_gml_node_index();
	l_this.h_d = l_h_d;
	l_this.h_arr = l_h_arr;
	l_this.h_index = l_h_index;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_index_set() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_arr
	/// @hint {ast_GmlNode} :h_index
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_arr", "h_index", "h_val"];
	static __enumIndex__ = 69;
}

if (live_enabled) 
function gml_node_index_set(l_h_d, l_h_arr, l_h_index, l_h_val) {
	var l_this = new mc_gml_node_index_set();
	l_this.h_d = l_h_d;
	l_this.h_arr = l_h_arr;
	l_this.h_index = l_h_index;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_index_aop() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_arr
	/// @hint {ast_GmlNode} :h_index
	/// @hint {gml_op} :h_op
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_arr", "h_index", "h_op", "h_val"];
	static __enumIndex__ = 70;
}

if (live_enabled) 
function gml_node_index_aop(l_h_d, l_h_arr, l_h_index, l_h_op, l_h_val) {
	var l_this = new mc_gml_node_index_aop();
	l_this.h_d = l_h_d;
	l_this.h_arr = l_h_arr;
	l_this.h_index = l_h_index;
	l_this.h_op = l_h_op;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_index2d() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_arr
	/// @hint {ast_GmlNode} :h_index1
	/// @hint {ast_GmlNode} :h_index2
	static __enumParams__ = ["h_d", "h_arr", "h_index1", "h_index2"];
	static __enumIndex__ = 71;
}

if (live_enabled) 
function gml_node_index2d(l_h_d, l_h_arr, l_h_index1, l_h_index2) {
	var l_this = new mc_gml_node_index2d();
	l_this.h_d = l_h_d;
	l_this.h_arr = l_h_arr;
	l_this.h_index1 = l_h_index1;
	l_this.h_index2 = l_h_index2;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_index2d_set() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_arr
	/// @hint {ast_GmlNode} :h_index1
	/// @hint {ast_GmlNode} :h_index2
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_arr", "h_index1", "h_index2", "h_val"];
	static __enumIndex__ = 72;
}

if (live_enabled) 
function gml_node_index2d_set(l_h_d, l_h_arr, l_h_index1, l_h_index2, l_h_val) {
	var l_this = new mc_gml_node_index2d_set();
	l_this.h_d = l_h_d;
	l_this.h_arr = l_h_arr;
	l_this.h_index1 = l_h_index1;
	l_this.h_index2 = l_h_index2;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_index2d_aop() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_arr
	/// @hint {ast_GmlNode} :h_index1
	/// @hint {ast_GmlNode} :h_index2
	/// @hint {gml_op} :h_op
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_arr", "h_index1", "h_index2", "h_op", "h_val"];
	static __enumIndex__ = 73;
}

if (live_enabled) 
function gml_node_index2d_aop(l_h_d, l_h_arr, l_h_index1, l_h_index2, l_h_op, l_h_val) {
	var l_this = new mc_gml_node_index2d_aop();
	l_this.h_d = l_h_d;
	l_this.h_arr = l_h_arr;
	l_this.h_index1 = l_h_index1;
	l_this.h_index2 = l_h_index2;
	l_this.h_op = l_h_op;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_raw_id() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_arr
	/// @hint {ast_GmlNode} :h_index
	static __enumParams__ = ["h_d", "h_arr", "h_index"];
	static __enumIndex__ = 74;
}

if (live_enabled) 
function gml_node_raw_id(l_h_d, l_h_arr, l_h_index) {
	var l_this = new mc_gml_node_raw_id();
	l_this.h_d = l_h_d;
	l_this.h_arr = l_h_arr;
	l_this.h_index = l_h_index;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_raw_id_set() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_arr
	/// @hint {ast_GmlNode} :h_index
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_arr", "h_index", "h_val"];
	static __enumIndex__ = 75;
}

if (live_enabled) 
function gml_node_raw_id_set(l_h_d, l_h_arr, l_h_index, l_h_val) {
	var l_this = new mc_gml_node_raw_id_set();
	l_this.h_d = l_h_d;
	l_this.h_arr = l_h_arr;
	l_this.h_index = l_h_index;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_raw_id_aop() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_arr
	/// @hint {ast_GmlNode} :h_index
	/// @hint {gml_op} :h_op
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_arr", "h_index", "h_op", "h_val"];
	static __enumIndex__ = 76;
}

if (live_enabled) 
function gml_node_raw_id_aop(l_h_d, l_h_arr, l_h_index, l_h_op, l_h_val) {
	var l_this = new mc_gml_node_raw_id_aop();
	l_this.h_d = l_h_d;
	l_this.h_arr = l_h_arr;
	l_this.h_index = l_h_index;
	l_this.h_op = l_h_op;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_raw_id2d() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_arr
	/// @hint {ast_GmlNode} :h_index1
	/// @hint {ast_GmlNode} :h_index2
	static __enumParams__ = ["h_d", "h_arr", "h_index1", "h_index2"];
	static __enumIndex__ = 77;
}

if (live_enabled) 
function gml_node_raw_id2d(l_h_d, l_h_arr, l_h_index1, l_h_index2) {
	var l_this = new mc_gml_node_raw_id2d();
	l_this.h_d = l_h_d;
	l_this.h_arr = l_h_arr;
	l_this.h_index1 = l_h_index1;
	l_this.h_index2 = l_h_index2;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_raw_id2d_set() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_arr
	/// @hint {ast_GmlNode} :h_index1
	/// @hint {ast_GmlNode} :h_index2
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_arr", "h_index1", "h_index2", "h_val"];
	static __enumIndex__ = 78;
}

if (live_enabled) 
function gml_node_raw_id2d_set(l_h_d, l_h_arr, l_h_index1, l_h_index2, l_h_val) {
	var l_this = new mc_gml_node_raw_id2d_set();
	l_this.h_d = l_h_d;
	l_this.h_arr = l_h_arr;
	l_this.h_index1 = l_h_index1;
	l_this.h_index2 = l_h_index2;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_raw_id2d_aop() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_arr
	/// @hint {ast_GmlNode} :h_index1
	/// @hint {ast_GmlNode} :h_index2
	/// @hint {gml_op} :h_op
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_arr", "h_index1", "h_index2", "h_op", "h_val"];
	static __enumIndex__ = 79;
}

if (live_enabled) 
function gml_node_raw_id2d_aop(l_h_d, l_h_arr, l_h_index1, l_h_index2, l_h_op, l_h_val) {
	var l_this = new mc_gml_node_raw_id2d_aop();
	l_this.h_d = l_h_d;
	l_this.h_arr = l_h_arr;
	l_this.h_index1 = l_h_index1;
	l_this.h_index2 = l_h_index2;
	l_this.h_op = l_h_op;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_ds_list() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_list
	/// @hint {ast_GmlNode} :h_index
	static __enumParams__ = ["h_d", "h_list", "h_index"];
	static __enumIndex__ = 80;
}

if (live_enabled) 
function gml_node_ds_list(l_h_d, l_h_list, l_h_index) {
	var l_this = new mc_gml_node_ds_list();
	l_this.h_d = l_h_d;
	l_this.h_list = l_h_list;
	l_this.h_index = l_h_index;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_ds_list_set_hx() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_list
	/// @hint {ast_GmlNode} :h_index
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_list", "h_index", "h_val"];
	static __enumIndex__ = 81;
}

if (live_enabled) 
function gml_node_ds_list_set_hx(l_h_d, l_h_list, l_h_index, l_h_val) {
	var l_this = new mc_gml_node_ds_list_set_hx();
	l_this.h_d = l_h_d;
	l_this.h_list = l_h_list;
	l_this.h_index = l_h_index;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_ds_list_aop() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_list
	/// @hint {ast_GmlNode} :h_index
	/// @hint {gml_op} :h_op
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_list", "h_index", "h_op", "h_val"];
	static __enumIndex__ = 82;
}

if (live_enabled) 
function gml_node_ds_list_aop(l_h_d, l_h_list, l_h_index, l_h_op, l_h_val) {
	var l_this = new mc_gml_node_ds_list_aop();
	l_this.h_d = l_h_d;
	l_this.h_list = l_h_list;
	l_this.h_index = l_h_index;
	l_this.h_op = l_h_op;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_ds_map() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_map
	/// @hint {ast_GmlNode} :h_key
	static __enumParams__ = ["h_d", "h_map", "h_key"];
	static __enumIndex__ = 83;
}

if (live_enabled) 
function gml_node_ds_map(l_h_d, l_h_map, l_h_key) {
	var l_this = new mc_gml_node_ds_map();
	l_this.h_d = l_h_d;
	l_this.h_map = l_h_map;
	l_this.h_key = l_h_key;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_ds_map_set_hx() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_map
	/// @hint {ast_GmlNode} :h_key
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_map", "h_key", "h_val"];
	static __enumIndex__ = 84;
}

if (live_enabled) 
function gml_node_ds_map_set_hx(l_h_d, l_h_map, l_h_key, l_h_val) {
	var l_this = new mc_gml_node_ds_map_set_hx();
	l_this.h_d = l_h_d;
	l_this.h_map = l_h_map;
	l_this.h_key = l_h_key;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_ds_map_aop() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_map
	/// @hint {ast_GmlNode} :h_key
	/// @hint {gml_op} :h_op
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_map", "h_key", "h_op", "h_val"];
	static __enumIndex__ = 85;
}

if (live_enabled) 
function gml_node_ds_map_aop(l_h_d, l_h_map, l_h_key, l_h_op, l_h_val) {
	var l_this = new mc_gml_node_ds_map_aop();
	l_this.h_d = l_h_d;
	l_this.h_map = l_h_map;
	l_this.h_key = l_h_key;
	l_this.h_op = l_h_op;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_ds_grid() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_grid
	/// @hint {ast_GmlNode} :h_index1
	/// @hint {ast_GmlNode} :h_index2
	static __enumParams__ = ["h_d", "h_grid", "h_index1", "h_index2"];
	static __enumIndex__ = 86;
}

if (live_enabled) 
function gml_node_ds_grid(l_h_d, l_h_grid, l_h_index1, l_h_index2) {
	var l_this = new mc_gml_node_ds_grid();
	l_this.h_d = l_h_d;
	l_this.h_grid = l_h_grid;
	l_this.h_index1 = l_h_index1;
	l_this.h_index2 = l_h_index2;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_ds_grid_set_hx() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_grid
	/// @hint {ast_GmlNode} :h_index1
	/// @hint {ast_GmlNode} :h_index2
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_grid", "h_index1", "h_index2", "h_val"];
	static __enumIndex__ = 87;
}

if (live_enabled) 
function gml_node_ds_grid_set_hx(l_h_d, l_h_grid, l_h_index1, l_h_index2, l_h_val) {
	var l_this = new mc_gml_node_ds_grid_set_hx();
	l_this.h_d = l_h_d;
	l_this.h_grid = l_h_grid;
	l_this.h_index1 = l_h_index1;
	l_this.h_index2 = l_h_index2;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_ds_grid_aop() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_grid
	/// @hint {ast_GmlNode} :h_index1
	/// @hint {ast_GmlNode} :h_index2
	/// @hint {gml_op} :h_op
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_grid", "h_index1", "h_index2", "h_op", "h_val"];
	static __enumIndex__ = 88;
}

if (live_enabled) 
function gml_node_ds_grid_aop(l_h_d, l_h_grid, l_h_index1, l_h_index2, l_h_op, l_h_val) {
	var l_this = new mc_gml_node_ds_grid_aop();
	l_this.h_d = l_h_d;
	l_this.h_grid = l_h_grid;
	l_this.h_index1 = l_h_index1;
	l_this.h_index2 = l_h_index2;
	l_this.h_op = l_h_op;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_key_id() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_obj
	/// @hint {ast_GmlNode} :h_key
	static __enumParams__ = ["h_d", "h_obj", "h_key"];
	static __enumIndex__ = 89;
}

if (live_enabled) 
function gml_node_key_id(l_h_d, l_h_obj, l_h_key) {
	var l_this = new mc_gml_node_key_id();
	l_this.h_d = l_h_d;
	l_this.h_obj = l_h_obj;
	l_this.h_key = l_h_key;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_key_id_set() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_obj
	/// @hint {ast_GmlNode} :h_key
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_obj", "h_key", "h_val"];
	static __enumIndex__ = 90;
}

if (live_enabled) 
function gml_node_key_id_set(l_h_d, l_h_obj, l_h_key, l_h_val) {
	var l_this = new mc_gml_node_key_id_set();
	l_this.h_d = l_h_d;
	l_this.h_obj = l_h_obj;
	l_this.h_key = l_h_key;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_key_id_aop() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_obj
	/// @hint {ast_GmlNode} :h_key
	/// @hint {gml_op} :h_op
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_obj", "h_key", "h_op", "h_val"];
	static __enumIndex__ = 91;
}

if (live_enabled) 
function gml_node_key_id_aop(l_h_d, l_h_obj, l_h_key, l_h_op, l_h_val) {
	var l_this = new mc_gml_node_key_id_aop();
	l_this.h_d = l_h_d;
	l_this.h_obj = l_h_obj;
	l_this.h_key = l_h_key;
	l_this.h_op = l_h_op;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_var_decl() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {string} :h_name
	/// @hint {ast_GmlNode?} :h_val
	static __enumParams__ = ["h_d", "h_name", "h_val"];
	static __enumIndex__ = 92;
}

if (live_enabled) 
function gml_node_var_decl(l_h_d, l_h_name, l_h_val) {
	var l_this = new mc_gml_node_var_decl();
	l_this.h_d = l_h_d;
	l_this.h_name = l_h_name;
	l_this.h_val = l_h_val;
	if (false) return argument[2];
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_block() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {array<ast_GmlNode>} :h_nodes
	static __enumParams__ = ["h_d", "h_nodes"];
	static __enumIndex__ = 93;
}

if (live_enabled) 
function gml_node_block(l_h_d, l_h_nodes) {
	var l_this = new mc_gml_node_block();
	l_this.h_d = l_h_d;
	l_this.h_nodes = l_h_nodes;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_if_then() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_cond
	/// @hint {ast_GmlNode} :h_then
	/// @hint {ast_GmlNode?} :h_not
	static __enumParams__ = ["h_d", "h_cond", "h_then", "h_not"];
	static __enumIndex__ = 94;
}

if (live_enabled) 
function gml_node_if_then(l_h_d, l_h_cond, l_h_then, l_h_not) {
	var l_this = new mc_gml_node_if_then();
	l_this.h_d = l_h_d;
	l_this.h_cond = l_h_cond;
	l_this.h_then = l_h_then;
	l_this.h_not = l_h_not;
	if (false) return argument[3];
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_ternary() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_cond
	/// @hint {ast_GmlNode} :h_then
	/// @hint {ast_GmlNode} :h_not
	static __enumParams__ = ["h_d", "h_cond", "h_then", "h_not"];
	static __enumIndex__ = 95;
}

if (live_enabled) 
function gml_node_ternary(l_h_d, l_h_cond, l_h_then, l_h_not) {
	var l_this = new mc_gml_node_ternary();
	l_this.h_d = l_h_d;
	l_this.h_cond = l_h_cond;
	l_this.h_then = l_h_then;
	l_this.h_not = l_h_not;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_switch_hx() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_expr
	/// @hint {array<ast_GmlNodeCase>} :h_cases
	/// @hint {ast_GmlNode?} :h_def
	static __enumParams__ = ["h_d", "h_expr", "h_cases", "h_def"];
	static __enumIndex__ = 96;
}

if (live_enabled) 
function gml_node_switch_hx(l_h_d, l_h_expr, l_h_cases, l_h_def) {
	var l_this = new mc_gml_node_switch_hx();
	l_this.h_d = l_h_d;
	l_this.h_expr = l_h_expr;
	l_this.h_cases = l_h_cases;
	l_this.h_def = l_h_def;
	if (false) return argument[3];
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_wait() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_time
	static __enumParams__ = ["h_d", "h_time"];
	static __enumIndex__ = 97;
}

if (live_enabled) 
function gml_node_wait(l_h_d, l_h_time) {
	var l_this = new mc_gml_node_wait();
	l_this.h_d = l_h_d;
	l_this.h_time = l_h_time;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_fork() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	static __enumParams__ = ["h_d"];
	static __enumIndex__ = 98;
}

if (live_enabled) 
function gml_node_fork(l_h_d) {
	var l_this = new mc_gml_node_fork();
	l_this.h_d = l_h_d;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_while_hx() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_cond
	/// @hint {ast_GmlNode} :h_loop
	static __enumParams__ = ["h_d", "h_cond", "h_loop"];
	static __enumIndex__ = 99;
}

if (live_enabled) 
function gml_node_while_hx(l_h_d, l_h_cond, l_h_loop) {
	var l_this = new mc_gml_node_while_hx();
	l_this.h_d = l_h_d;
	l_this.h_cond = l_h_cond;
	l_this.h_loop = l_h_loop;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_do_until() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_loop
	/// @hint {ast_GmlNode} :h_cond
	static __enumParams__ = ["h_d", "h_loop", "h_cond"];
	static __enumIndex__ = 100;
}

if (live_enabled) 
function gml_node_do_until(l_h_d, l_h_loop, l_h_cond) {
	var l_this = new mc_gml_node_do_until();
	l_this.h_d = l_h_d;
	l_this.h_loop = l_h_loop;
	l_this.h_cond = l_h_cond;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_do_while() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_loop
	/// @hint {ast_GmlNode} :h_cond
	static __enumParams__ = ["h_d", "h_loop", "h_cond"];
	static __enumIndex__ = 101;
}

if (live_enabled) 
function gml_node_do_while(l_h_d, l_h_loop, l_h_cond) {
	var l_this = new mc_gml_node_do_while();
	l_this.h_d = l_h_d;
	l_this.h_loop = l_h_loop;
	l_this.h_cond = l_h_cond;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_repeat_hx() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_times
	/// @hint {ast_GmlNode} :h_loop
	static __enumParams__ = ["h_d", "h_times", "h_loop"];
	static __enumIndex__ = 102;
}

if (live_enabled) 
function gml_node_repeat_hx(l_h_d, l_h_times, l_h_loop) {
	var l_this = new mc_gml_node_repeat_hx();
	l_this.h_d = l_h_d;
	l_this.h_times = l_h_times;
	l_this.h_loop = l_h_loop;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_for_hx() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_pre
	/// @hint {ast_GmlNode} :h_cond
	/// @hint {ast_GmlNode} :h_post
	/// @hint {ast_GmlNode} :h_loop
	static __enumParams__ = ["h_d", "h_pre", "h_cond", "h_post", "h_loop"];
	static __enumIndex__ = 103;
}

if (live_enabled) 
function gml_node_for_hx(l_h_d, l_h_pre, l_h_cond, l_h_post, l_h_loop) {
	var l_this = new mc_gml_node_for_hx();
	l_this.h_d = l_h_d;
	l_this.h_pre = l_h_pre;
	l_this.h_cond = l_h_cond;
	l_this.h_post = l_h_post;
	l_this.h_loop = l_h_loop;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_with_hx() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_ctx
	/// @hint {ast_GmlNode} :h_loop
	static __enumParams__ = ["h_d", "h_ctx", "h_loop"];
	static __enumIndex__ = 104;
}

if (live_enabled) 
function gml_node_with_hx(l_h_d, l_h_ctx, l_h_loop) {
	var l_this = new mc_gml_node_with_hx();
	l_this.h_d = l_h_d;
	l_this.h_ctx = l_h_ctx;
	l_this.h_loop = l_h_loop;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_once() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_loop
	static __enumParams__ = ["h_d", "h_loop"];
	static __enumIndex__ = 105;
}

if (live_enabled) 
function gml_node_once(l_h_d, l_h_loop) {
	var l_this = new mc_gml_node_once();
	l_this.h_d = l_h_d;
	l_this.h_loop = l_h_loop;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_return_hx() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_val
	static __enumParams__ = ["h_d", "h_val"];
	static __enumIndex__ = 106;
}

if (live_enabled) 
function gml_node_return_hx(l_h_d, l_h_val) {
	var l_this = new mc_gml_node_return_hx();
	l_this.h_d = l_h_d;
	l_this.h_val = l_h_val;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_exit_hx() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	static __enumParams__ = ["h_d"];
	static __enumIndex__ = 107;
}

if (live_enabled) 
function gml_node_exit_hx(l_h_d) {
	var l_this = new mc_gml_node_exit_hx();
	l_this.h_d = l_h_d;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_break_hx() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	static __enumParams__ = ["h_d"];
	static __enumIndex__ = 108;
}

if (live_enabled) 
function gml_node_break_hx(l_h_d) {
	var l_this = new mc_gml_node_break_hx();
	l_this.h_d = l_h_d;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_continue_hx() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	static __enumParams__ = ["h_d"];
	static __enumIndex__ = 109;
}

if (live_enabled) 
function gml_node_continue_hx(l_h_d) {
	var l_this = new mc_gml_node_continue_hx();
	l_this.h_d = l_h_d;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_debugger() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	static __enumParams__ = ["h_d"];
	static __enumIndex__ = 110;
}

if (live_enabled) 
function gml_node_debugger(l_h_d) {
	var l_this = new mc_gml_node_debugger();
	l_this.h_d = l_h_d;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_try_catch() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_block
	/// @hint {string} :h_capvar
	/// @hint {ast_GmlNode} :h_catcher
	static __enumParams__ = ["h_d", "h_block", "h_capvar", "h_catcher"];
	static __enumIndex__ = 111;
}

if (live_enabled) 
function gml_node_try_catch(l_h_d, l_h_block, l_h_capvar, l_h_catcher) {
	var l_this = new mc_gml_node_try_catch();
	l_this.h_d = l_h_d;
	l_this.h_block = l_h_block;
	l_this.h_capvar = l_h_capvar;
	l_this.h_catcher = l_h_catcher;
	return l_this
}

if (live_enabled) 
/// @implements {gml_node}
function mc_gml_node_throw_hx() : mc_gml_node() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {ast_GmlNode} :h_err
	static __enumParams__ = ["h_d", "h_err"];
	static __enumIndex__ = 112;
}

if (live_enabled) 
function gml_node_throw_hx(l_h_d, l_h_err) {
	var l_this = new mc_gml_node_throw_hx();
	l_this.h_d = l_h_d;
	l_this.h_err = l_h_err;
	return l_this
}

#endregion
