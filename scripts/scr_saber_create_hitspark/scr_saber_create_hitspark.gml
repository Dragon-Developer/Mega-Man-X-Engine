/// @description Create a hitspark effect for this enemy
/// @param {real} enemy The enemy instance id
/// @param {boolean} blocking Is the enemy blocking the attack? 
function scr_saber_create_hitspark() {
	var enemy = argument[0];
	var is_blocking = (argument_count > 1 ? argument[1] : enemy.blocking);
	var inst = instance_create_layer(x, y, owner.layer_up, obj_player_saber_effect);
	inst.sprite_index = owner.saber_slash_sprite;
	if (is_blocking) {
		inst.sprite_index = owner.saber_slash_sprites[2];
		inst.plt_index = plt_index;
	} else {
		owner.saber_slash = false;	
	}
	inst.x = (3*instance_center_get_x(enemy) + x) / 4;
	inst.y = (3*instance_center_get_y(enemy) + y) / 4;
	inst.image_xscale = image_xscale;
	with (inst) {
		event_perform(ev_step, ev_step_normal);	
	}



}
