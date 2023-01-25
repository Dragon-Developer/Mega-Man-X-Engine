function instance_try_destroy() {
	if (instance_exists(argument[0])) instance_destroy(argument[0]);
	return noone;


}
