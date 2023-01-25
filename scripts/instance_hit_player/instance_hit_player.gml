function instance_hit_player() {
	var player_instance = (argument_count > 0 ? argument[0] : instance_place(x, y, obj_player_parent));
	if (argument_count == 0) {
		var player_instance = instance_place(x, y, obj_player_parent);
		return (player_instance != noone && player_instance.state == states.dolor);
	} else {
		return (place_meeting(x, y, argument[0]) && argument[0].state == states.dolor);	
	}
}
