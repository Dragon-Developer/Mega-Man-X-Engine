function gamepad_get_movement_mode() {
	ini_open("Settings/savedata.ini");
	var k = ini_read_real("SETTINGS", gamepad_get_description(argument[0]), 0);
	ini_close();
	return k == 1;


}
