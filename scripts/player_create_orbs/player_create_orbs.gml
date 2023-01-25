/// @description Create a certain amount of orbs
/// @param amount
/// @param initial_phase
function player_create_orbs() {
	var amount = argument[0];
	var initial_phase = (argument_count > 1 ? argument[1] : 0);
	var angle_section = 360 / amount;
	for (var i = 0; i < amount; i++) {
	    var orb = instance_create_depth(x, y, depth - 10, obj_player_death_orb);
	    orb.speed_direction = floor(angle_section * i + initial_phase);
		orb.plt_index = plt_index;
		orb.sprite_index = death_orb_sprite;
		with (orb) {
			plt_texture = other.plt_texture;
		}
	}
}
