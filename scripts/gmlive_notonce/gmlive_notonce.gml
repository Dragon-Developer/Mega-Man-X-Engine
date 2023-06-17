// for those who think that something doesn't work because of
// "unused variable" warnings, I present a script that
// formally references the functions/variables while having
// absolutely no effect.
if (false) {
	var v = undefined;
	var f = undefined;
	live_constant_add("", 0);
	live_constant_delete("");
	live_variable_add("", f);
	live_variable_delete("");
	live_function_add("", f);
	live_function_delete("");
	gml_func_copy("", "");
	gml_enum_create_builtin("");
	
	live_method(undefined, f);
	live_method_get_self(f);
	live_script_get_index("");
	live_throw_error("");
	
	sprite_set_live(v, 0);
	shader_set_live(v, 0);
	room_set_live(v, 0);
	room_goto_live(v);
	
	live_name = "GMLive_notOnce";
	live_call();
	live_call_ext([]);
	live_defcall(0);
	live_defcall_ext([], 0);
	
	live_execute_string("");
	v = live_snippet_create("", "");
	live_snippet_call(v);
	live_snippet_destroy(v);
	
	with (v) {
		h_add();
		h_dump();
		h_get_error_ptr();
	}
	v = new gml_std_haxe_Exception();
	v = new haxe_ds_basic_map();
	v = new mt_gml_std_haxe_class();
	v = new mt_gml_std_haxe_enum();
	
	array_set_2D([[]], 0, 0, 0);
}