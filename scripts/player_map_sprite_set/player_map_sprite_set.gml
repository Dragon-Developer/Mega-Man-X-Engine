function player_map_sprite_set() {
	var sprite_to_add = argument[0];
	var sprite_map = argument[1];
	var k = argument[2];
	var part = argument[3];
	var map = (sprite_map == sprite_str) ? my_sprites[| part] : my_sprites_shoot[| part];
	map[? k] = noone;

	if (sprite_to_add == -1) {
		if (sprite_map == sprite_shoot_str) {
			var map2 = my_sprites[| part];
			map[? k] = map2[? k];
		}
	} else {
		map[? k] = sprite_to_add;
	}
	sprite_fix_origin(map[? k]);
}
