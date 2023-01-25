event_inherited();
animation_add("S", [
	0, 0,
	3, 1,
	7, 2,
	11, 3
]);
animation_play("S");
can_hit = false;
collide_damage = 0;
phy_type = phy_types.NEW;
animation_end_destroy = true;
grav = 0;