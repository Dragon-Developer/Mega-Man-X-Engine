event_inherited();
#region Animations
animation_add("charge", [
	0, 0,
	1, 1,
	3, 2
], 0, 3);
animation_add("dash_charge", [
	0, 0,
	1, 1,
	3, 2
], 0, 3);
animation_add("punch_charged", [
	0, 0,
	2, 1,
	3, 2,
	4, 3,
	6, 4,
	7, 5,
	8, 6
], 6, 8);
animation_add("punch_charged_end|punch_charged", [
	0, 3,
	4, 0,
	5, 0
]);
animation_add("dash_punch_charged", [
	0, 0,
	2, 1,
	3, 2,
	4, 3,
	6, 4,
	7, 5,
	8, 6
], 6, 8);
animation_add("dash_punch_charged_end|dash_punch_charged", [
	0, 3,
	4, 0,
	5, 0
]);
// Load
ride_load_sprites();
animation_play("disabled");
#endregion
#region Character Position
character_origin_offset = { x: 2, y: -13 };
character_map_offset[? "activated"] = [
	{ x: -9, y: 9 },
	{ x: -6, y: 3 },
	{ x: -3, y: -1 },
	{ x: 0, y: 0 },
	{ x: 1, y: 1 },
	{ x: 0, y: 0 }
];
character_map_offset[? "dash"] = [
	{ x: 0, y: 0 },
	{ x: 1, y: 1 },
	{ x: 3, y: 2 }
];
character_map_offset[? "dash_punch"] = [
	{ i: 3, x: 3, y: 2 },
	{ i: 4, x: 3, y: 2 },
	{ i: 4, x: 4, y: 2 }
];
character_map_offset[? "jump"] =  [
	{ x: 0, y: -7 },
	{ x: 0, y: -7 },
	{ x: 0, y: -2 },
	{ x: 0, y: 0 },
	{ x: 0, y: 1 },
	{ x: 0, y: 1 }
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
	{ i: 1, x: 0, y: -3 },
	{ i: 2, x: 0, y: -2 },
	{ i: 1, x: 0, y: -1 },
	{ i: 0, x: 0, y: -2 },
	{ i: 1, x: 0, y: -3 },
	{ i: 2, x: 0, y: -2 },
	{ i: 1, x: 0, y: -1 },
	{ i: 0, x: 0, y: -2 }
];
character_map_offset[? "punch_charged"] = [
	{ i: 0, x: 3, y: 3 },
	{ i: 0, x: 3, y: 3 },
	{ i: 3, x: 4, y: 2 },
	{ i: 3, x: 4, y: 2 },
	{ i: 4, x: 4, y: 2 },
	{ i: 4, x: 4, y: 2 },
	{ i: 4, x: 4, y: 2 }
];
character_map_offset[? "dash_punch_charged"] = [
	{ i: 0, x: 3, y: 3 },
	{ i: 0, x: 3, y: 3 },
	{ i: 3, x: 4, y: 2 },
	{ i: 3, x: 4, y: 2 },
	{ i: 4, x: 4, y: 2 },
	{ i: 4, x: 4, y: 2 },
	{ i: 4, x: 4, y: 2 }
];
character_map_offset[? "charge"] = [
	{ i: 0, x: 3, y: 3 },
	{ i: 0, x: 3, y: 3 },
	{ i: 2, x: 3, y: 2 }
];
character_map_offset[? "dash_charge"] = [
	{ x: 3, y: 3 },
	{ x: 3, y: 3 },
	{ x: 3, y: 3 }
];
#endregion
steam_effect[0].y += 7;
steam_effect[0].x -= 2;
steam_effect[1].y += 7;
steam_effect[1].x -= 2;
hover_unlocked = true;
charge_unlocked = true;
punch_default_object = obj_ride_punch_x2;
dolor_effect.object = obj_ride_x2_damage;