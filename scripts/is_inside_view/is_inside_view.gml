var cam = view_camera[0];
var vx = camera_get_view_x(cam);
var vy = camera_get_view_y(cam);
var vw = camera_get_view_width(cam);
var vh = camera_get_view_height(cam);

return (bbox_right > vx && bbox_left < vx + vw && bbox_bottom > vy && bbox_top < vy + vh);