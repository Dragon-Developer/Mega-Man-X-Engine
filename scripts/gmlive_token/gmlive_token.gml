// GMLive.gml (c) YellowAfterlife, 2017+
// PLEASE DO NOT FORGET to remove paid extensions from your project when publishing the source code!
// And if you are using git, you can exclude GMLive by adding
// `scripts/GMLive*` and `extensions/GMLive/` lines to your `.gitignore`.
// Feather disable all

// Parser tokens
#region gml.token

if (live_enabled) /// @interface {gml_token}
function mc_gml_token() constructor {
	/// @hint {array} gml_token:__enumParams__
	/// @hint {int} gml_token:__enumIndex__
	static getIndex = method(undefined, gml_std_enum_getIndex);
	static toString = method(undefined, gml_std_enum_toString);
	static __enum__ = mt_gml_token;
}

if (live_enabled) 
/// @implements {gml_token}
function mc_gml_token_header() : mc_gml_token() constructor {
	/// @hint {gml_pos} :h_d
	/// @hint {string} :h_name
	/// @hint {bool} :h_lb
	static __enumParams__ = ["h_d", "h_name", "h_lb"];
	static __enumIndex__ = 0;
}

if (live_enabled) 
function gml_token_header(l_h_d, l_h_name, l_h_lb) {
	var l_this = new mc_gml_token_header();
	l_this.h_d = l_h_d;
	l_this.h_name = l_h_name;
	l_this.h_lb = l_h_lb;
	return l_this
}

if (live_enabled) 
/// @implements {gml_token}
function mc_gml_token_macro_def() : mc_gml_token() constructor {
	/// @hint {gml_pos} :h_d
	/// @hint {string} :h_config
	/// @hint {string} :h_name
	/// @hint {string} :h_rest
	static __enumParams__ = ["h_d", "h_config", "h_name", "h_rest"];
	static __enumIndex__ = 1;
}

if (live_enabled) 
function gml_token_macro_def(l_h_d, l_h_config, l_h_name, l_h_rest) {
	var l_this = new mc_gml_token_macro_def();
	l_this.h_d = l_h_d;
	l_this.h_config = l_h_config;
	l_this.h_name = l_h_name;
	l_this.h_rest = l_h_rest;
	return l_this
}

if (live_enabled) 
/// @implements {gml_token}
function mc_gml_token_macro_start() : mc_gml_token() constructor {
	/// @hint {gml_pos} :h_d
	static __enumParams__ = ["h_d"];
	static __enumIndex__ = 2;
}

if (live_enabled) 
function gml_token_macro_start(l_h_d) {
	var l_this = new mc_gml_token_macro_start();
	l_this.h_d = l_h_d;
	return l_this
}

if (live_enabled) 
/// @implements {gml_token}
function mc_gml_token_hash() : mc_gml_token() constructor {
	/// @hint {gml_pos} :h_d
	static __enumParams__ = ["h_d"];
	static __enumIndex__ = 3;
}

if (live_enabled) 
function gml_token_hash(l_h_d) {
	var l_this = new mc_gml_token_hash();
	l_this.h_d = l_h_d;
	return l_this
}

if (live_enabled) 
/// @implements {gml_token}
function mc_gml_token_semico() : mc_gml_token() constructor {
	/// @hint {gml_pos} :h_d
	static __enumParams__ = ["h_d"];
	static __enumIndex__ = 4;
}

if (live_enabled) 
function gml_token_semico(l_h_d) {
	var l_this = new mc_gml_token_semico();
	l_this.h_d = l_h_d;
	return l_this
}

if (live_enabled) 
/// @implements {gml_token}
function mc_gml_token_comma() : mc_gml_token() constructor {
	/// @hint {gml_pos} :h_d
	static __enumParams__ = ["h_d"];
	static __enumIndex__ = 5;
}

if (live_enabled) 
function gml_token_comma(l_h_d) {
	var l_this = new mc_gml_token_comma();
	l_this.h_d = l_h_d;
	return l_this
}

if (live_enabled) 
/// @implements {gml_token}
function mc_gml_token_period() : mc_gml_token() constructor {
	/// @hint {gml_pos} :h_d
	static __enumParams__ = ["h_d"];
	static __enumIndex__ = 6;
}

if (live_enabled) 
function gml_token_period(l_h_d) {
	var l_this = new mc_gml_token_period();
	l_this.h_d = l_h_d;
	return l_this
}

if (live_enabled) 
/// @implements {gml_token}
function mc_gml_token_colon() : mc_gml_token() constructor {
	/// @hint {gml_pos} :h_d
	static __enumParams__ = ["h_d"];
	static __enumIndex__ = 7;
}

if (live_enabled) 
function gml_token_colon(l_h_d) {
	var l_this = new mc_gml_token_colon();
	l_this.h_d = l_h_d;
	return l_this
}

if (live_enabled) 
/// @implements {gml_token}
function mc_gml_token_qmark() : mc_gml_token() constructor {
	/// @hint {gml_pos} :h_d
	static __enumParams__ = ["h_d"];
	static __enumIndex__ = 8;
}

if (live_enabled) 
function gml_token_qmark(l_h_d) {
	var l_this = new mc_gml_token_qmark();
	l_this.h_d = l_h_d;
	return l_this
}

if (live_enabled) 
/// @implements {gml_token}
function mc_gml_token_at_sign() : mc_gml_token() constructor {
	/// @hint {gml_pos} :h_d
	static __enumParams__ = ["h_d"];
	static __enumIndex__ = 9;
}

if (live_enabled) 
function gml_token_at_sign(l_h_d) {
	var l_this = new mc_gml_token_at_sign();
	l_this.h_d = l_h_d;
	return l_this
}

if (live_enabled) 
/// @implements {gml_token}
function mc_gml_token_dollar_sign() : mc_gml_token() constructor {
	/// @hint {gml_pos} :h_d
	static __enumParams__ = ["h_d"];
	static __enumIndex__ = 10;
}

if (live_enabled) 
function gml_token_dollar_sign(l_h_d) {
	var l_this = new mc_gml_token_dollar_sign();
	l_this.h_d = l_h_d;
	return l_this
}

if (live_enabled) 
/// @implements {gml_token}
function mc_gml_token_keyword() : mc_gml_token() constructor {
	/// @hint {gml_pos} :h_d
	/// @hint {ast_GmlKeyword} :h_kw
	static __enumParams__ = ["h_d", "h_kw"];
	static __enumIndex__ = 11;
}

if (live_enabled) 
function gml_token_keyword(l_h_d, l_h_kw) {
	var l_this = new mc_gml_token_keyword();
	l_this.h_d = l_h_d;
	l_this.h_kw = l_h_kw;
	return l_this
}

if (live_enabled) 
/// @implements {gml_token}
function mc_gml_token_ident() : mc_gml_token() constructor {
	/// @hint {gml_pos} :h_d
	/// @hint {string} :h_id
	static __enumParams__ = ["h_d", "h_id"];
	static __enumIndex__ = 12;
}

if (live_enabled) 
function gml_token_ident(l_h_d, l_h_id) {
	var l_this = new mc_gml_token_ident();
	l_this.h_d = l_h_d;
	l_this.h_id = l_h_id;
	return l_this
}

if (live_enabled) 
/// @implements {gml_token}
function mc_gml_token_undefined_hx() : mc_gml_token() constructor {
	/// @hint {gml_pos} :h_d
	static __enumParams__ = ["h_d"];
	static __enumIndex__ = 13;
}

if (live_enabled) 
function gml_token_undefined_hx(l_h_d) {
	var l_this = new mc_gml_token_undefined_hx();
	l_this.h_d = l_h_d;
	return l_this
}

if (live_enabled) 
/// @implements {gml_token}
function mc_gml_token_boolean() : mc_gml_token() constructor {
	/// @hint {ast_GmlNodeData} :h_d
	/// @hint {bool} :h_value
	static __enumParams__ = ["h_d", "h_value"];
	static __enumIndex__ = 14;
}

if (live_enabled) 
function gml_token_boolean(l_h_d, l_h_value) {
	var l_this = new mc_gml_token_boolean();
	l_this.h_d = l_h_d;
	l_this.h_value = l_h_value;
	return l_this
}

if (live_enabled) 
/// @implements {gml_token}
function mc_gml_token_number() : mc_gml_token() constructor {
	/// @hint {gml_pos} :h_d
	/// @hint {number} :h_nu
	/// @hint {string} :h_src
	static __enumParams__ = ["h_d", "h_nu", "h_src"];
	static __enumIndex__ = 15;
}

if (live_enabled) 
function gml_token_number(l_h_d, l_h_nu, l_h_src) {
	var l_this = new mc_gml_token_number();
	l_this.h_d = l_h_d;
	l_this.h_nu = l_h_nu;
	l_this.h_src = l_h_src;
	return l_this
}

if (live_enabled) 
/// @implements {gml_token}
function mc_gml_token_cstring() : mc_gml_token() constructor {
	/// @hint {gml_pos} :h_d
	/// @hint {string} :h_st
	static __enumParams__ = ["h_d", "h_st"];
	static __enumIndex__ = 16;
}

if (live_enabled) 
function gml_token_cstring(l_h_d, l_h_st) {
	var l_this = new mc_gml_token_cstring();
	l_this.h_d = l_h_d;
	l_this.h_st = l_h_st;
	return l_this
}

if (live_enabled) 
/// @implements {gml_token}
function mc_gml_token_un_op() : mc_gml_token() constructor {
	/// @hint {gml_pos} :h_d
	/// @hint {ast_GmlUnOp} :h_op
	static __enumParams__ = ["h_d", "h_op"];
	static __enumIndex__ = 17;
}

if (live_enabled) 
function gml_token_un_op(l_h_d, l_h_op) {
	var l_this = new mc_gml_token_un_op();
	l_this.h_d = l_h_d;
	l_this.h_op = l_h_op;
	return l_this
}

if (live_enabled) 
/// @implements {gml_token}
function mc_gml_token_adjfix() : mc_gml_token() constructor {
	/// @hint {gml_pos} :h_d
	/// @hint {bool} :h_inc
	static __enumParams__ = ["h_d", "h_inc"];
	static __enumIndex__ = 18;
}

if (live_enabled) 
function gml_token_adjfix(l_h_d, l_h_inc) {
	var l_this = new mc_gml_token_adjfix();
	l_this.h_d = l_h_d;
	l_this.h_inc = l_h_inc;
	return l_this
}

if (live_enabled) 
/// @implements {gml_token}
function mc_gml_token_bin_op() : mc_gml_token() constructor {
	/// @hint {gml_pos} :h_d
	/// @hint {gml_op} :h_op
	static __enumParams__ = ["h_d", "h_op"];
	static __enumIndex__ = 19;
}

if (live_enabled) 
function gml_token_bin_op(l_h_d, l_h_op) {
	var l_this = new mc_gml_token_bin_op();
	l_this.h_d = l_h_d;
	l_this.h_op = l_h_op;
	return l_this
}

if (live_enabled) 
/// @implements {gml_token}
function mc_gml_token_set_op() : mc_gml_token() constructor {
	/// @hint {gml_pos} :h_d
	/// @hint {gml_op} :h_op
	static __enumParams__ = ["h_d", "h_op"];
	static __enumIndex__ = 20;
}

if (live_enabled) 
function gml_token_set_op(l_h_d, l_h_op) {
	var l_this = new mc_gml_token_set_op();
	l_this.h_d = l_h_d;
	l_this.h_op = l_h_op;
	return l_this
}

if (live_enabled) 
/// @implements {gml_token}
function mc_gml_token_par_open() : mc_gml_token() constructor {
	/// @hint {gml_pos} :h_d
	static __enumParams__ = ["h_d"];
	static __enumIndex__ = 21;
}

if (live_enabled) 
function gml_token_par_open(l_h_d) {
	var l_this = new mc_gml_token_par_open();
	l_this.h_d = l_h_d;
	return l_this
}

if (live_enabled) 
/// @implements {gml_token}
function mc_gml_token_par_close() : mc_gml_token() constructor {
	/// @hint {gml_pos} :h_d
	static __enumParams__ = ["h_d"];
	static __enumIndex__ = 22;
}

if (live_enabled) 
function gml_token_par_close(l_h_d) {
	var l_this = new mc_gml_token_par_close();
	l_this.h_d = l_h_d;
	return l_this
}

if (live_enabled) 
/// @implements {gml_token}
function mc_gml_token_sqb_open() : mc_gml_token() constructor {
	/// @hint {gml_pos} :h_d
	static __enumParams__ = ["h_d"];
	static __enumIndex__ = 23;
}

if (live_enabled) 
function gml_token_sqb_open(l_h_d) {
	var l_this = new mc_gml_token_sqb_open();
	l_this.h_d = l_h_d;
	return l_this
}

if (live_enabled) 
/// @implements {gml_token}
function mc_gml_token_sqb_close() : mc_gml_token() constructor {
	/// @hint {gml_pos} :h_d
	static __enumParams__ = ["h_d"];
	static __enumIndex__ = 24;
}

if (live_enabled) 
function gml_token_sqb_close(l_h_d) {
	var l_this = new mc_gml_token_sqb_close();
	l_this.h_d = l_h_d;
	return l_this
}

if (live_enabled) 
/// @implements {gml_token}
function mc_gml_token_cub_open() : mc_gml_token() constructor {
	/// @hint {gml_pos} :h_d
	static __enumParams__ = ["h_d"];
	static __enumIndex__ = 25;
}

if (live_enabled) 
function gml_token_cub_open(l_h_d) {
	var l_this = new mc_gml_token_cub_open();
	l_this.h_d = l_h_d;
	return l_this
}

if (live_enabled) 
/// @implements {gml_token}
function mc_gml_token_cub_close() : mc_gml_token() constructor {
	/// @hint {gml_pos} :h_d
	static __enumParams__ = ["h_d"];
	static __enumIndex__ = 26;
}

if (live_enabled) 
function gml_token_cub_close(l_h_d) {
	var l_this = new mc_gml_token_cub_close();
	l_this.h_d = l_h_d;
	return l_this
}

if (live_enabled) 
/// @implements {gml_token}
function mc_gml_token_arg_const() : mc_gml_token() constructor {
	/// @hint {gml_pos} :h_d
	/// @hint {int} :h_i
	static __enumParams__ = ["h_d", "h_i"];
	static __enumIndex__ = 27;
}

if (live_enabled) 
function gml_token_arg_const(l_h_d, l_h_i) {
	var l_this = new mc_gml_token_arg_const();
	l_this.h_d = l_h_d;
	l_this.h_i = l_h_i;
	return l_this
}

if (live_enabled) 
/// @implements {gml_token}
function mc_gml_token_null_co() : mc_gml_token() constructor {
	/// @hint {gml_pos} :h_d
	static __enumParams__ = ["h_d"];
	static __enumIndex__ = 28;
}

if (live_enabled) 
function gml_token_null_co(l_h_d) {
	var l_this = new mc_gml_token_null_co();
	l_this.h_d = l_h_d;
	return l_this
}

if (live_enabled) 
/// @implements {gml_token}
function mc_gml_token_null_co_set() : mc_gml_token() constructor {
	/// @hint {gml_pos} :h_d
	static __enumParams__ = ["h_d"];
	static __enumIndex__ = 29;
}

if (live_enabled) 
function gml_token_null_co_set(l_h_d) {
	var l_this = new mc_gml_token_null_co_set();
	l_this.h_d = l_h_d;
	return l_this
}

if (live_enabled) 
/// @implements {gml_token}
function mc_gml_token_pragma() : mc_gml_token() constructor {
	/// @hint {gml_pos} :h_d
	/// @hint {string} :h_name
	/// @hint {string} :h_value
	static __enumParams__ = ["h_d", "h_name", "h_value"];
	static __enumIndex__ = 30;
}

if (live_enabled) 
function gml_token_pragma(l_h_d, l_h_name, l_h_value) {
	var l_this = new mc_gml_token_pragma();
	l_this.h_d = l_h_d;
	l_this.h_name = l_h_name;
	l_this.h_value = l_h_value;
	return l_this
}

#endregion
