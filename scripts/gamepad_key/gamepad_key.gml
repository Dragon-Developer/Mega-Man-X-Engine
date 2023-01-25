function gamepad_key() {
	/* 
	Note:   - emulates keyboard_key behaviour.
			- returns 0 if no input deteced
			- susceptible to future gp_constant order changes
			- ideally set up an axis deadzone to avoid unwanted return values
	*/

	if (global.gp_supported && gamepad_is_connected(argument[0]))
	{
		// See gamepad_to_string - loop all buttons
		for (var i = gp_face1; i <= gp_padr; i++)
		{
			if (gamepad_button_check_pressed(argument[0], i))
			{
				return i;
			}
		}
		/*
		for (var i = gp_axislh; i <= gp_axisrv; i++) // Loop analogue axis
		{
			if (gamepad_axis_value(argument[0], i) != 0)
			{
				return i;
			}
		}*/
	}
	return -1;


}
