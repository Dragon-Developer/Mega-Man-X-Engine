/// @param grav
/// @param h_speed
/// @param v_speed
function scr_physics_init() {
	grav = (argument_count > 0 ? argument[0] : 0);
	h_speed = (argument_count > 1 ? argument[1] : 0);
	v_speed = (argument_count > 2 ? argument[2] : 0);
	h_acceleration = 0;
	v_acceleration = 0;

	// Floor/Ceil check
	iof = false;
	ioc = false;

	last_x_check = 0;
	last_y_check = 0;

	_frame = 0;
	_frame2 = 0;

	physics_ignore_frame = 0;

	vspeed_max_normal = 5.75;
	vspeed_max_water = vspeed_max_normal / 2;
	vspeed_max = vspeed_max_normal;
	
	gravity_normal = grav;
	gravity_water = grav / 2;
	gravity_default = gravity_normal;
	
	water_physics_enabled = false;
	under_water = false;
	water_instance = noone;
	through_walls = false;
}
