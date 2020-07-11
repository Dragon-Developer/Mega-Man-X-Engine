var ignore_solids = (argument_count > 0 ? argument[0] : true);
v_speed += grav;

if (ignore_solids || is_place_free(x, y + v_speed)) y += v_speed;
if (ignore_solids || is_place_free(x + h_speed, y)) x += h_speed;

_frame = _frame2 + 1;
if (_frame > 10) _frame = 0;