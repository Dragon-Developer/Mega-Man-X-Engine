global_values();
global.view_width = 320;
global.view_height = 240;
alarm[0] = 1;
keys_init();
gamepad_init();
audio_init();
mobile_start();
bosses_init();
instance_create_depth(0, 0, 0, obj_gamepad_manager);

global.screen_width = display_get_width();
global.screen_height = display_get_height();

if (os_type == os_android)
{
	display_set_gui_size((720 / global.screen_height) * global.screen_width, 720);
	display_set_gui_maximise();
}