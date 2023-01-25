event_inherited();
atk = 4;
shot_level = 2;
boss_damage[? noone] = 1;
hit_if_shot_level_is_equal = true;
animation_add("D",[0 , 0]);
animation_add("B",[0 , 0]);
animation_play("D");
owner = noone;
trail_init(4);
index = 0;
shot_rotate = true;
depths = [-1, 1];

// These values were obtained through screenshots at each frame because
// I was not able to obtain a simple function that generated this type of movement
offsets[0] = [-4, 9];
offsets[1] = [0, 8];
offsets[2] = [2, 10];
offsets[3] = [3, 5];
offsets[4] = [6, 4];
offsets[5] = [8, -1];
offsets[6] = [10, -5];
offsets[7] = [9, -9];
offsets[8] = [7, -8];
offsets[9] = [6, -10];
offsets[10] = [4, -5];
offsets[11] = [3, -4];

offsets[12] = [2, 1];
offsets[13] = [0, 5];
offsets[14] = [1, 9];
offsets[15] = [2, 8];
offsets[16] = [5, 10];
offsets[17] = [8, 5];
offsets[18] = [9, 4];
offsets[19] = [11, -1];
offsets[20] = [14, -5];
offsets[21] = [13, -9];
offsets[22] = [11, -8];
offsets[23] = [9, -10];
offsets[24] = [7, -5];

physics_auto = false;