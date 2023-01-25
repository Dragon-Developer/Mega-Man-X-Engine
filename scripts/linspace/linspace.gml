/// @description  linspace(start, last, amount_floor)
/// @param start
/// @param  last
/// @param  amount_floor
function linspace(argument0, argument1, argument2) {
	var start, last, amount, ds, a, b;
	start = argument0;
	last = argument1;
	amount = floor(argument2);
	ds = ds_list_create();
	a = last - start;
	b = a / (amount - 1);
	for (i = 0; i < amount; i += 1) {
	    ds_list_add(ds, start + i * b);
	}
	return ds;



}
