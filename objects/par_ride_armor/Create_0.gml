/// @description Initialize Ride Armor
event_inherited();
ride_armor_init();
#region Animations
animation_add("disabled|activated", [
	0, 0
], 0);
animation_add("activated", [
	0, 0,
	8, 1,
	16, 2,
	24, 3,
	32, 4,
	42, 5
]);
animation_add("deactivating|activated", [
	0, 5,
	1, 4,
	9, 3,
	17, 2,
	25, 1,
	35, 0,
	48, 0
]);
animation_add("idle|activated", [
	0, 5
], 0);
animation_add("walk", [
	0, 0,
	5, 1,
	11, 2,
	17, 3,
	23, 4,
	29, 5,
	35, 6,
	41, 7,
	46, 7
], 0, 46);
animation_add("dash", [
	0, 0,
	3, 1,
	7, 2,
], 7);
animation_add("dash_end|dash", [
	0, 2,
	1, 1,
	3, 0
], 3);
animation_add("jump", [
	0, 0,
	1, 1,
	3, 0
], 3);
animation_add("hover|jump", [
	0, 0,
	2, 1,
	3, 1
], 0, 3);
animation_add("fall|jump", [
	0, 0
], 0);
animation_add("land|jump", [
	0, 2,
	1, 3,
	3, 4,
	5, 5,
	7, 5,
	9, 5,
	11, 4,
	14, 4
]);
animation_add("punch", [
	0, 0,
	3, 1,
	7, 2
], 7);
animation_add("punch_end|punch", [
	0, 1,
	4, 0,
	5, 0
]);
animation_add("jump_punch", [
	0, 0,
	3, 1,
	7, 2
], 7);
animation_add("jump_punch_end|jump_punch", [
	0, 1,
	4, 0,
	5, 0
]);
animation_add("dash_punch", [
	0, 0,
	3, 1,
	7, 2
], 7);
animation_add("dash_punch_end|dash_punch", [
	0, 1,
	4, 0,
	5, 0
]);
#endregion
#region Character Position
character_map_offset[? "activated"] = [
	{ x: -16, y: 13 },
	{ x: -14, y: 8 },
	{ x: -10, y: 4 },
	{ x: 0, y: 0 },
	{ x: 2, y: 1 },
	{ x: 0, y: 0 }
];
character_map_offset[? "dash"] = [
	{ x: 2, y: 1 },
	{ x: 4, y: 2 },
	{ x: 5, y: 4 }
];
character_map_offset[? "dash_punch"] = [
	{ i: 3, x: 5, y: 4 },
	{ i: 4, x: 5, y: 4 },
	{ i: 4, x: 6, y: 4 }
];
character_map_offset[? "jump"] =  [
	{ x: 0, y: -7 },
	{ x: 0, y: -7 },
	{ x: 0, y: -2 },
	{ x: 0, y: 0 },
	{ x: 0, y: 1 },
	{ x: 0, y: 2 }
];
character_map_offset[? "jump_punch"] = [
	{ i: 3, x: -1, y: -7 },
	{ i: 4, x: 0, y: -7 },
	{ i: 4, x: 1, y: -7 }
];
character_map_offset[? "punch"] = [
	{ i: 3, x: 0, y: 0 },
	{ i: 4, x: 1, y: 0 },
	{ i: 4, x: 2, y: 0 }
];
character_map_offset[? "walk"] = [
	{ i: 1, x: 1, y: -4 },
	{ i: 2, x: 1, y: -3 },
	{ i: 1, x: 1, y: -1 },
	{ i: 0, x: 1, y: -3 },
	{ i: 1, x: 1, y: -4 },
	{ i: 2, x: 1, y: -3 },
	{ i: 1, x: 1, y: -1 },
	{ i: 0, x: 1, y: -3 }
];
#endregion