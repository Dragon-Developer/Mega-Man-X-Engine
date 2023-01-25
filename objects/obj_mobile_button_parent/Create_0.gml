/// @description Insert description here
// You can write your code in this editor

enum mobile_buttons {
	none,
	up,
	down,
	left,
	right,
	dash,
	jump,
	shoot,
	shoot2,
	special,
	weapon1,
	weapon2,
	length
}

// Position on GUI
draw_x = 0;
draw_y = 0;

btn_type = mobile_buttons.none;
previous_room = room;
restart_button = false;
image_alpha = 0.7;
image_speed = 0;

if (x > 640) {
	x = global.screen_width - (global.screen_height / room_height) * (room_width - x);
}
else
{
	x *= global.screen_width / room_width;
}

y *= global.screen_height / room_height;
image_xscale *= (global.screen_height / room_height);
image_yscale *= (global.screen_height / room_height);
