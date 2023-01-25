amount = 1;
enum pickup_types {
	none,
	heart,
	hp,
	wp,
	subtank,
	energytank,
	lifeup
}
wait_timer = 0;
timer = 0;
pickup_pause = false;
pickup_type = pickup_types.none;
time_per_unit = 4;
min_limit = 0;
bar_light = false;
weapon_id = -1;
weapon_fill_other = false;
fill_sound = snd_item_health;
instant_fill = false;