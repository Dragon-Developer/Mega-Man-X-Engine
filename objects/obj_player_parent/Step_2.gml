/// @description Limit player position
if (state == states.intro || state == states.outro) exit;
x = clamp(x, limit_x[0], limit_x[1]);
with (obj_player_shot_parent) {
	if (owner == other.id) {
		local_game_speed = other.local_game_speed;
		if (follow_owner && other.state != states.ride) {
			if (other.shoot && ds_map_exists(other.weapon_offset, other.animation_sprite_name)) {
				var l = other.weapon_offset[? other.animation_sprite_name];
				var p = [0, 0];
				var index = other.animation_i;
				if (ds_list_size(l) == 1)
					index = 0;
				p = l[| index];
				if (array_length(other.weapon_dir_offsets) > 0 && index < array_length(other.weapon_dir_offsets)) {
					p[0] += other.weapon_dir_offsets[index][0];
					p[1] += other.weapon_dir_offsets[index][1];
				}
				x = floor(other.x) + other.dir*p[0];
				y = floor(other.y) + other.y_dir*p[1];
				image_xscale = other.dir;
			} else {
				x += other.x - other.x_previous;
				y += other.y - other.y_previous;
			}
		}
	}
}
x_previous = x;
y_previous = y;

if (instance_exists(defense_shield_inst)) {
	defense_shield_inst.x = floor(x);
	defense_shield_inst.y = floor(y);
	defense_shield_inst.image_xscale = xscale;
}