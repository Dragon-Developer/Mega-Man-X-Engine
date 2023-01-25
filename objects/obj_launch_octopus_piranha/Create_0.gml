event_inherited();
hp = 1;
damage_set(4, 6, 7);
damageable = true;
//blocking = array_get([0, 0, 1], global.difficulty);
hp = array_get([1, 2, 3], global.difficulty);
shot_type = 0;
phy_type = phy_types.NEW;
through_walls = true;
grav = 0;
gravity_default = 0;

abs_speed_max = array_get([5, 5.5, 6.5], global.difficulty);
abs_speed = 1;
acceleration = 0.125;
target = noone;
h_accel = 0;
v_accel = 0;
dir_angle = 0;

shot_type = 2;
homing_limit_min = 5;
homing_limit_max = array_get([35, 45, 80], global.difficulty);
accel_type = 1;
auto_rotate = false;
animation_auto = false;

persist = true;
image_index_update = false;