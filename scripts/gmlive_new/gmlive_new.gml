// GMLive.gml (c) YellowAfterlife, 2017+
// PLEASE DO NOT FORGET to remove paid extensions from your project when publishing the source code!
// And if you are using git, you can exclude GMLive by adding
// `scripts/GMLive*` and `extensions/GMLive/` lines to your `.gitignore`.
// Feather disable all

// because there is no script_execute_ext for new X(...)
#region vm.impl.gml_thread_construct

if (live_enabled) 
function vm_impl_gml_thread_construct_error() {
	gml_thread_error("Calls only support up to " + string(81) + " arguments at this time");
	return undefined;
}

if (live_enabled) 
function vm_impl_gml_thread_construct_init() {
	return [vm_impl_gml_thread_construct_with0, vm_impl_gml_thread_construct_with1, vm_impl_gml_thread_construct_with2, vm_impl_gml_thread_construct_with3, vm_impl_gml_thread_construct_with4, vm_impl_gml_thread_construct_with5, vm_impl_gml_thread_construct_with6, vm_impl_gml_thread_construct_with7, vm_impl_gml_thread_construct_with8, vm_impl_gml_thread_construct_with9, vm_impl_gml_thread_construct_with10, vm_impl_gml_thread_construct_with11, vm_impl_gml_thread_construct_with12, vm_impl_gml_thread_construct_with13, vm_impl_gml_thread_construct_with14, vm_impl_gml_thread_construct_with15, vm_impl_gml_thread_construct_with16, vm_impl_gml_thread_construct_with17, vm_impl_gml_thread_construct_with18, vm_impl_gml_thread_construct_with19, vm_impl_gml_thread_construct_with20, vm_impl_gml_thread_construct_with21, vm_impl_gml_thread_construct_with22, vm_impl_gml_thread_construct_with23, vm_impl_gml_thread_construct_with24, vm_impl_gml_thread_construct_with25, vm_impl_gml_thread_construct_with26, vm_impl_gml_thread_construct_with27, vm_impl_gml_thread_construct_with28, vm_impl_gml_thread_construct_with29, vm_impl_gml_thread_construct_with30, vm_impl_gml_thread_construct_with31, vm_impl_gml_thread_construct_with32, vm_impl_gml_thread_construct_with33, vm_impl_gml_thread_construct_with34, vm_impl_gml_thread_construct_with35, vm_impl_gml_thread_construct_with36, vm_impl_gml_thread_construct_with37, vm_impl_gml_thread_construct_with38, vm_impl_gml_thread_construct_with39, vm_impl_gml_thread_construct_with40, vm_impl_gml_thread_construct_with41, vm_impl_gml_thread_construct_with42, vm_impl_gml_thread_construct_with43, vm_impl_gml_thread_construct_with44, vm_impl_gml_thread_construct_with45, vm_impl_gml_thread_construct_with46, vm_impl_gml_thread_construct_with47, vm_impl_gml_thread_construct_with48, vm_impl_gml_thread_construct_with49, vm_impl_gml_thread_construct_with50, vm_impl_gml_thread_construct_with51, vm_impl_gml_thread_construct_with52, vm_impl_gml_thread_construct_with53, vm_impl_gml_thread_construct_with54, vm_impl_gml_thread_construct_with55, vm_impl_gml_thread_construct_with56, vm_impl_gml_thread_construct_with57, vm_impl_gml_thread_construct_with58, vm_impl_gml_thread_construct_with59, vm_impl_gml_thread_construct_with60, vm_impl_gml_thread_construct_with61, vm_impl_gml_thread_construct_with62, vm_impl_gml_thread_construct_with63, vm_impl_gml_thread_construct_with64, vm_impl_gml_thread_construct_with65, vm_impl_gml_thread_construct_with66, vm_impl_gml_thread_construct_with67, vm_impl_gml_thread_construct_with68, vm_impl_gml_thread_construct_with69, vm_impl_gml_thread_construct_with70, vm_impl_gml_thread_construct_with71, vm_impl_gml_thread_construct_with72, vm_impl_gml_thread_construct_with73, vm_impl_gml_thread_construct_with74, vm_impl_gml_thread_construct_with75, vm_impl_gml_thread_construct_with76, vm_impl_gml_thread_construct_with77, vm_impl_gml_thread_construct_with78, vm_impl_gml_thread_construct_with79, vm_impl_gml_thread_construct_with80];
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with0(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c();
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with1(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with2(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with3(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with4(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with5(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with6(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with7(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with8(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with9(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with10(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with11(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with12(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with13(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with14(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with15(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with16(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with17(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with18(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with19(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with20(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with21(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with22(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with23(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with24(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with25(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with26(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with27(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with28(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with29(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with30(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with31(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with32(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with33(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with34(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with35(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with36(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with37(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with38(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with39(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with40(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with41(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with42(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with43(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with44(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with45(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with46(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with47(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with48(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46], l_w[l_i + 47]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with49(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46], l_w[l_i + 47], l_w[l_i + 48]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with50(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46], l_w[l_i + 47], l_w[l_i + 48], l_w[l_i + 49]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with51(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46], l_w[l_i + 47], l_w[l_i + 48], l_w[l_i + 49], l_w[l_i + 50]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with52(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46], l_w[l_i + 47], l_w[l_i + 48], l_w[l_i + 49], l_w[l_i + 50], l_w[l_i + 51]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with53(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46], l_w[l_i + 47], l_w[l_i + 48], l_w[l_i + 49], l_w[l_i + 50], l_w[l_i + 51], l_w[l_i + 52]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with54(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46], l_w[l_i + 47], l_w[l_i + 48], l_w[l_i + 49], l_w[l_i + 50], l_w[l_i + 51], l_w[l_i + 52], l_w[l_i + 53]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with55(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46], l_w[l_i + 47], l_w[l_i + 48], l_w[l_i + 49], l_w[l_i + 50], l_w[l_i + 51], l_w[l_i + 52], l_w[l_i + 53], l_w[l_i + 54]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with56(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46], l_w[l_i + 47], l_w[l_i + 48], l_w[l_i + 49], l_w[l_i + 50], l_w[l_i + 51], l_w[l_i + 52], l_w[l_i + 53], l_w[l_i + 54], l_w[l_i + 55]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with57(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46], l_w[l_i + 47], l_w[l_i + 48], l_w[l_i + 49], l_w[l_i + 50], l_w[l_i + 51], l_w[l_i + 52], l_w[l_i + 53], l_w[l_i + 54], l_w[l_i + 55], l_w[l_i + 56]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with58(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46], l_w[l_i + 47], l_w[l_i + 48], l_w[l_i + 49], l_w[l_i + 50], l_w[l_i + 51], l_w[l_i + 52], l_w[l_i + 53], l_w[l_i + 54], l_w[l_i + 55], l_w[l_i + 56], l_w[l_i + 57]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with59(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46], l_w[l_i + 47], l_w[l_i + 48], l_w[l_i + 49], l_w[l_i + 50], l_w[l_i + 51], l_w[l_i + 52], l_w[l_i + 53], l_w[l_i + 54], l_w[l_i + 55], l_w[l_i + 56], l_w[l_i + 57], l_w[l_i + 58]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with60(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46], l_w[l_i + 47], l_w[l_i + 48], l_w[l_i + 49], l_w[l_i + 50], l_w[l_i + 51], l_w[l_i + 52], l_w[l_i + 53], l_w[l_i + 54], l_w[l_i + 55], l_w[l_i + 56], l_w[l_i + 57], l_w[l_i + 58], l_w[l_i + 59]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with61(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46], l_w[l_i + 47], l_w[l_i + 48], l_w[l_i + 49], l_w[l_i + 50], l_w[l_i + 51], l_w[l_i + 52], l_w[l_i + 53], l_w[l_i + 54], l_w[l_i + 55], l_w[l_i + 56], l_w[l_i + 57], l_w[l_i + 58], l_w[l_i + 59], l_w[l_i + 60]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with62(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46], l_w[l_i + 47], l_w[l_i + 48], l_w[l_i + 49], l_w[l_i + 50], l_w[l_i + 51], l_w[l_i + 52], l_w[l_i + 53], l_w[l_i + 54], l_w[l_i + 55], l_w[l_i + 56], l_w[l_i + 57], l_w[l_i + 58], l_w[l_i + 59], l_w[l_i + 60], l_w[l_i + 61]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with63(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46], l_w[l_i + 47], l_w[l_i + 48], l_w[l_i + 49], l_w[l_i + 50], l_w[l_i + 51], l_w[l_i + 52], l_w[l_i + 53], l_w[l_i + 54], l_w[l_i + 55], l_w[l_i + 56], l_w[l_i + 57], l_w[l_i + 58], l_w[l_i + 59], l_w[l_i + 60], l_w[l_i + 61], l_w[l_i + 62]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with64(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46], l_w[l_i + 47], l_w[l_i + 48], l_w[l_i + 49], l_w[l_i + 50], l_w[l_i + 51], l_w[l_i + 52], l_w[l_i + 53], l_w[l_i + 54], l_w[l_i + 55], l_w[l_i + 56], l_w[l_i + 57], l_w[l_i + 58], l_w[l_i + 59], l_w[l_i + 60], l_w[l_i + 61], l_w[l_i + 62], l_w[l_i + 63]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with65(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46], l_w[l_i + 47], l_w[l_i + 48], l_w[l_i + 49], l_w[l_i + 50], l_w[l_i + 51], l_w[l_i + 52], l_w[l_i + 53], l_w[l_i + 54], l_w[l_i + 55], l_w[l_i + 56], l_w[l_i + 57], l_w[l_i + 58], l_w[l_i + 59], l_w[l_i + 60], l_w[l_i + 61], l_w[l_i + 62], l_w[l_i + 63], l_w[l_i + 64]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with66(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46], l_w[l_i + 47], l_w[l_i + 48], l_w[l_i + 49], l_w[l_i + 50], l_w[l_i + 51], l_w[l_i + 52], l_w[l_i + 53], l_w[l_i + 54], l_w[l_i + 55], l_w[l_i + 56], l_w[l_i + 57], l_w[l_i + 58], l_w[l_i + 59], l_w[l_i + 60], l_w[l_i + 61], l_w[l_i + 62], l_w[l_i + 63], l_w[l_i + 64], l_w[l_i + 65]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with67(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46], l_w[l_i + 47], l_w[l_i + 48], l_w[l_i + 49], l_w[l_i + 50], l_w[l_i + 51], l_w[l_i + 52], l_w[l_i + 53], l_w[l_i + 54], l_w[l_i + 55], l_w[l_i + 56], l_w[l_i + 57], l_w[l_i + 58], l_w[l_i + 59], l_w[l_i + 60], l_w[l_i + 61], l_w[l_i + 62], l_w[l_i + 63], l_w[l_i + 64], l_w[l_i + 65], l_w[l_i + 66]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with68(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46], l_w[l_i + 47], l_w[l_i + 48], l_w[l_i + 49], l_w[l_i + 50], l_w[l_i + 51], l_w[l_i + 52], l_w[l_i + 53], l_w[l_i + 54], l_w[l_i + 55], l_w[l_i + 56], l_w[l_i + 57], l_w[l_i + 58], l_w[l_i + 59], l_w[l_i + 60], l_w[l_i + 61], l_w[l_i + 62], l_w[l_i + 63], l_w[l_i + 64], l_w[l_i + 65], l_w[l_i + 66], l_w[l_i + 67]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with69(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46], l_w[l_i + 47], l_w[l_i + 48], l_w[l_i + 49], l_w[l_i + 50], l_w[l_i + 51], l_w[l_i + 52], l_w[l_i + 53], l_w[l_i + 54], l_w[l_i + 55], l_w[l_i + 56], l_w[l_i + 57], l_w[l_i + 58], l_w[l_i + 59], l_w[l_i + 60], l_w[l_i + 61], l_w[l_i + 62], l_w[l_i + 63], l_w[l_i + 64], l_w[l_i + 65], l_w[l_i + 66], l_w[l_i + 67], l_w[l_i + 68]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with70(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46], l_w[l_i + 47], l_w[l_i + 48], l_w[l_i + 49], l_w[l_i + 50], l_w[l_i + 51], l_w[l_i + 52], l_w[l_i + 53], l_w[l_i + 54], l_w[l_i + 55], l_w[l_i + 56], l_w[l_i + 57], l_w[l_i + 58], l_w[l_i + 59], l_w[l_i + 60], l_w[l_i + 61], l_w[l_i + 62], l_w[l_i + 63], l_w[l_i + 64], l_w[l_i + 65], l_w[l_i + 66], l_w[l_i + 67], l_w[l_i + 68], l_w[l_i + 69]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with71(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46], l_w[l_i + 47], l_w[l_i + 48], l_w[l_i + 49], l_w[l_i + 50], l_w[l_i + 51], l_w[l_i + 52], l_w[l_i + 53], l_w[l_i + 54], l_w[l_i + 55], l_w[l_i + 56], l_w[l_i + 57], l_w[l_i + 58], l_w[l_i + 59], l_w[l_i + 60], l_w[l_i + 61], l_w[l_i + 62], l_w[l_i + 63], l_w[l_i + 64], l_w[l_i + 65], l_w[l_i + 66], l_w[l_i + 67], l_w[l_i + 68], l_w[l_i + 69], l_w[l_i + 70]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with72(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46], l_w[l_i + 47], l_w[l_i + 48], l_w[l_i + 49], l_w[l_i + 50], l_w[l_i + 51], l_w[l_i + 52], l_w[l_i + 53], l_w[l_i + 54], l_w[l_i + 55], l_w[l_i + 56], l_w[l_i + 57], l_w[l_i + 58], l_w[l_i + 59], l_w[l_i + 60], l_w[l_i + 61], l_w[l_i + 62], l_w[l_i + 63], l_w[l_i + 64], l_w[l_i + 65], l_w[l_i + 66], l_w[l_i + 67], l_w[l_i + 68], l_w[l_i + 69], l_w[l_i + 70], l_w[l_i + 71]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with73(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46], l_w[l_i + 47], l_w[l_i + 48], l_w[l_i + 49], l_w[l_i + 50], l_w[l_i + 51], l_w[l_i + 52], l_w[l_i + 53], l_w[l_i + 54], l_w[l_i + 55], l_w[l_i + 56], l_w[l_i + 57], l_w[l_i + 58], l_w[l_i + 59], l_w[l_i + 60], l_w[l_i + 61], l_w[l_i + 62], l_w[l_i + 63], l_w[l_i + 64], l_w[l_i + 65], l_w[l_i + 66], l_w[l_i + 67], l_w[l_i + 68], l_w[l_i + 69], l_w[l_i + 70], l_w[l_i + 71], l_w[l_i + 72]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with74(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46], l_w[l_i + 47], l_w[l_i + 48], l_w[l_i + 49], l_w[l_i + 50], l_w[l_i + 51], l_w[l_i + 52], l_w[l_i + 53], l_w[l_i + 54], l_w[l_i + 55], l_w[l_i + 56], l_w[l_i + 57], l_w[l_i + 58], l_w[l_i + 59], l_w[l_i + 60], l_w[l_i + 61], l_w[l_i + 62], l_w[l_i + 63], l_w[l_i + 64], l_w[l_i + 65], l_w[l_i + 66], l_w[l_i + 67], l_w[l_i + 68], l_w[l_i + 69], l_w[l_i + 70], l_w[l_i + 71], l_w[l_i + 72], l_w[l_i + 73]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with75(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46], l_w[l_i + 47], l_w[l_i + 48], l_w[l_i + 49], l_w[l_i + 50], l_w[l_i + 51], l_w[l_i + 52], l_w[l_i + 53], l_w[l_i + 54], l_w[l_i + 55], l_w[l_i + 56], l_w[l_i + 57], l_w[l_i + 58], l_w[l_i + 59], l_w[l_i + 60], l_w[l_i + 61], l_w[l_i + 62], l_w[l_i + 63], l_w[l_i + 64], l_w[l_i + 65], l_w[l_i + 66], l_w[l_i + 67], l_w[l_i + 68], l_w[l_i + 69], l_w[l_i + 70], l_w[l_i + 71], l_w[l_i + 72], l_w[l_i + 73], l_w[l_i + 74]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with76(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46], l_w[l_i + 47], l_w[l_i + 48], l_w[l_i + 49], l_w[l_i + 50], l_w[l_i + 51], l_w[l_i + 52], l_w[l_i + 53], l_w[l_i + 54], l_w[l_i + 55], l_w[l_i + 56], l_w[l_i + 57], l_w[l_i + 58], l_w[l_i + 59], l_w[l_i + 60], l_w[l_i + 61], l_w[l_i + 62], l_w[l_i + 63], l_w[l_i + 64], l_w[l_i + 65], l_w[l_i + 66], l_w[l_i + 67], l_w[l_i + 68], l_w[l_i + 69], l_w[l_i + 70], l_w[l_i + 71], l_w[l_i + 72], l_w[l_i + 73], l_w[l_i + 74], l_w[l_i + 75]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with77(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46], l_w[l_i + 47], l_w[l_i + 48], l_w[l_i + 49], l_w[l_i + 50], l_w[l_i + 51], l_w[l_i + 52], l_w[l_i + 53], l_w[l_i + 54], l_w[l_i + 55], l_w[l_i + 56], l_w[l_i + 57], l_w[l_i + 58], l_w[l_i + 59], l_w[l_i + 60], l_w[l_i + 61], l_w[l_i + 62], l_w[l_i + 63], l_w[l_i + 64], l_w[l_i + 65], l_w[l_i + 66], l_w[l_i + 67], l_w[l_i + 68], l_w[l_i + 69], l_w[l_i + 70], l_w[l_i + 71], l_w[l_i + 72], l_w[l_i + 73], l_w[l_i + 74], l_w[l_i + 75], l_w[l_i + 76]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with78(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46], l_w[l_i + 47], l_w[l_i + 48], l_w[l_i + 49], l_w[l_i + 50], l_w[l_i + 51], l_w[l_i + 52], l_w[l_i + 53], l_w[l_i + 54], l_w[l_i + 55], l_w[l_i + 56], l_w[l_i + 57], l_w[l_i + 58], l_w[l_i + 59], l_w[l_i + 60], l_w[l_i + 61], l_w[l_i + 62], l_w[l_i + 63], l_w[l_i + 64], l_w[l_i + 65], l_w[l_i + 66], l_w[l_i + 67], l_w[l_i + 68], l_w[l_i + 69], l_w[l_i + 70], l_w[l_i + 71], l_w[l_i + 72], l_w[l_i + 73], l_w[l_i + 74], l_w[l_i + 75], l_w[l_i + 76], l_w[l_i + 77]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with79(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46], l_w[l_i + 47], l_w[l_i + 48], l_w[l_i + 49], l_w[l_i + 50], l_w[l_i + 51], l_w[l_i + 52], l_w[l_i + 53], l_w[l_i + 54], l_w[l_i + 55], l_w[l_i + 56], l_w[l_i + 57], l_w[l_i + 58], l_w[l_i + 59], l_w[l_i + 60], l_w[l_i + 61], l_w[l_i + 62], l_w[l_i + 63], l_w[l_i + 64], l_w[l_i + 65], l_w[l_i + 66], l_w[l_i + 67], l_w[l_i + 68], l_w[l_i + 69], l_w[l_i + 70], l_w[l_i + 71], l_w[l_i + 72], l_w[l_i + 73], l_w[l_i + 74], l_w[l_i + 75], l_w[l_i + 76], l_w[l_i + 77], l_w[l_i + 78]);
}

if (live_enabled) 
function vm_impl_gml_thread_construct_with80(l_f, l_w, l_i) {
	var l_c=l_f;
	return new l_c(l_w[l_i], l_w[l_i + 1], l_w[l_i + 2], l_w[l_i + 3], l_w[l_i + 4], l_w[l_i + 5], l_w[l_i + 6], l_w[l_i + 7], l_w[l_i + 8], l_w[l_i + 9], l_w[l_i + 10], l_w[l_i + 11], l_w[l_i + 12], l_w[l_i + 13], l_w[l_i + 14], l_w[l_i + 15], l_w[l_i + 16], l_w[l_i + 17], l_w[l_i + 18], l_w[l_i + 19], l_w[l_i + 20], l_w[l_i + 21], l_w[l_i + 22], l_w[l_i + 23], l_w[l_i + 24], l_w[l_i + 25], l_w[l_i + 26], l_w[l_i + 27], l_w[l_i + 28], l_w[l_i + 29], l_w[l_i + 30], l_w[l_i + 31], l_w[l_i + 32], l_w[l_i + 33], l_w[l_i + 34], l_w[l_i + 35], l_w[l_i + 36], l_w[l_i + 37], l_w[l_i + 38], l_w[l_i + 39], l_w[l_i + 40], l_w[l_i + 41], l_w[l_i + 42], l_w[l_i + 43], l_w[l_i + 44], l_w[l_i + 45], l_w[l_i + 46], l_w[l_i + 47], l_w[l_i + 48], l_w[l_i + 49], l_w[l_i + 50], l_w[l_i + 51], l_w[l_i + 52], l_w[l_i + 53], l_w[l_i + 54], l_w[l_i + 55], l_w[l_i + 56], l_w[l_i + 57], l_w[l_i + 58], l_w[l_i + 59], l_w[l_i + 60], l_w[l_i + 61], l_w[l_i + 62], l_w[l_i + 63], l_w[l_i + 64], l_w[l_i + 65], l_w[l_i + 66], l_w[l_i + 67], l_w[l_i + 68], l_w[l_i + 69], l_w[l_i + 70], l_w[l_i + 71], l_w[l_i + 72], l_w[l_i + 73], l_w[l_i + 74], l_w[l_i + 75], l_w[l_i + 76], l_w[l_i + 77], l_w[l_i + 78], l_w[l_i + 79]);
}

#endregion
