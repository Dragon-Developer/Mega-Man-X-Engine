#region Variables
event_inherited();
hp = 1;
collide_damage = 1;
fly_speed = 1.25;
grav = 0;
// Smoke
smoke_object = obj_bat_smoke;
smoke_limit = 7;
smoke_pos = [0, -12];
state_set(bat.hanging);
#endregion
#region Animations
// Hanging
animation_add("H",
[
	0, 0,
	16, 1,
	18, 2,
	20, 3,
	24, 2,
	26, 1,
	27, 1
], 0, 27);

// Attacking
animation_add("A",
[
	0, 6,
	1, 7,
	4, 6,
	7, 5,
	10, 4,
	13, 5,
	17, 6,
	19, 6
], 0, 19);
#endregion