event_inherited();
persist = true;
hp = 1;
damage_set(2, 4, 6);
damageable = false;
blocking = false;
shot_type = 0;
phy_type = phy_types.NEW;
through_walls = true;
grav = 0;
v_speed = -4;
abs_hspeed = 5;
animation_add("S", [
	0, 0,
	2, 1,
	4, 2,
	6, 3,
	7, 4,
	8, 5,
	9, 6,
], 6, 9);
animation_play("S");