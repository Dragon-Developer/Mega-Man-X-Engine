// Movement
var t = timer++;
if (t > 2) {
	abs_hspeed = 3;
	speed_direction += 1;
	if (speed_direction >= 360)
		speed_direction -= 360;	
}
if (t >= 78) {
    instance_destroy();
    exit;
}
x += lengthdir_x(abs_hspeed, speed_direction);
y += lengthdir_y(abs_hspeed, speed_direction);