event_inherited();
hp = 1;
grav = 0;
collide_damage = 3;
abs_hspeed = 3;
phy_type = phy_types.NEW;
through_walls = true;
audio_play(missileshot);
// Smoke
smoke_object = obj_gun_volt_smoke;
smoke_limit = 4;
smoke_pos = [-15, 0];