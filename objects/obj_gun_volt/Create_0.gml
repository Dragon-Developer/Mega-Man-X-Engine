#region Variables
event_inherited();
hp = 16;
atk = 3;
phy_type = phy_types.NEW;
atk_limit[0] = 2; // Missile
atk_limit[1] = 1; // Spark
face_x = false;
if (nearest_player.x > x)
	xscale = -1;
dir = -xscale;
#endregion
#region Animations
// Stand
animation_add("S", [
	0, 0,
	4, 1,
	7, 1
], 0, 7);
// Open
animation_add("O", [
	0, 2,
	3, 3,
	6, 4,
	9, 5,
	12, 4,
	36, 6,
	39, 7,
	42, 8,
	47, 9,
	50, 9
]);
// Attack
animation_add("A", [
	0, 10,
	21, 11,
	23, 12,
	26, 11,
	36, 11
]);
// Close
animation_add("C", [
	0, 13,
	4, 4,
	8, 5,
	12, 4,
	16, 3,
	20, 2,
	22, 2
]);
animation_play("S");
#endregion