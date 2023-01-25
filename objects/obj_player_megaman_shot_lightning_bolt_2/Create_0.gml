// Inherit the parent event
event_inherited();
sound = snd_megaman_lightning_bolt;
audio_stop(sound);
boss_damage[? noone] = 2;
can_hit = true;
melee_activated = false;
anti_destroy = true;
anti_destroy_limit = 0;
shot_counted = false;
animation_end_destroy = true;
atk = 4;
animation_add("S", [
	0, 0,
	4, 1,
	6, 2,
	8, 3,
	9, 3
]);
follow_owner = false;
animation_play("S");
