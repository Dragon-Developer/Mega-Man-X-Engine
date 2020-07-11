/// @param grav
/// @param h_speed
/// @param v_speed
grav = (argument_count > 0 ? argument[0] : 0);
h_speed = (argument_count > 1 ? argument[1] : 0);
v_speed = (argument_count > 2 ? argument[2] : 0);

// Floor/Ceil check
iof = false;
ioc = false;

last_x_check = 0;
last_y_check = 0;

_frame = 0;
_frame2 = 0;