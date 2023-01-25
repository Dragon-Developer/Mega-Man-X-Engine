PAUSE;
// Destroy
var t = timer;
if (t >= 2) x -= dir;
if (t == 11 || t == 26) x -= dir;
if (array_contains([8, 11, 14, 16, 18, 20, 21, 23, 24, 25], t) || (t >= 27)) y += 1;
if (t == 32)
{
    instance_destroy();
	room_speed = 60;
    exit;	
}
timer++;