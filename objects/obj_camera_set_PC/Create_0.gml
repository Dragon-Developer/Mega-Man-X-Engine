x = floor(x);
y = floor(y);
min_x = 16*round(bbox_left / 16);
min_y = 16*round(bbox_top / 16)
max_x = 16*round(bbox_right / 16);
max_y = 16*round(bbox_bottom / 16);
for (var i = 0; i < 4; i++) {
    change_min_x[i] = 0;
    change_min_y[i] = 0;
    change_max_x[i] = 0;
    change_max_y[i] = 0;
}

camera_id = id; ///creation_code
default_camera = false;
use_change = false;

lock_right = false;
lock_left = true;

vbor_min_y = -12;
vbor_max_y = 12;

slope_camera = false;
slope_camera_pos = [];

spawned = false;