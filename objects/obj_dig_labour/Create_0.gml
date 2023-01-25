event_inherited();
#region Variables
hp = 4;
collide_damage = 3;
hit = 0;
state_set(dig_labour.stand);
#endregion
#region Animations
// Stand
animation_add("S",
	[ 0, 0 ]
);
// Throw
animation_add("T",
[
	0, 1,
	5, 2,
	9, 3,
	13, 4,
	17, 5,
	34, 0
]);
// Laugh
animation_add("L", [
	0, 0,
	4, 6,
	8, 7,
	12, 6,
	15, 6
], 0, 15)

animation_play("S");
#endregion