var v_id = 0;
if (instance_exists(obj_camera_rds))
	v_id = obj_camera_rds.view_id;
vx = __view_get(e__VW.XView, v_id);
vy = __view_get(e__VW.YView, v_id);
vw = __view_get(e__VW.WView, v_id);
vh = __view_get(e__VW.HView, v_id);

while (vy < y) {
	y -= 16;
	image_yscale += 1;
}
while (y + sprite_height < vy + vh) {
	image_yscale += 1;
}