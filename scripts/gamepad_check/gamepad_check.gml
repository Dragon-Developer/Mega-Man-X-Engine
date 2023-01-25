function gamepad_check() {
	if (!global.gp_supported) exit;

	if (!gamepad_is_connected(global.gp_id)) {
		global.gp_id = -1;
		for (var i = 0; i < 12; i++) {
			if (gamepad_is_connected(i)) {
				global.gp_id = i;
				exit;
			}
		}
	}

	if (global.gp_id == -1)
		global.settings[1] = input_types.keyboard;


}
