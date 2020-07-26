enum saber_atks
{
	atk1, atk2, atk3,
	jump, wall
}

saber_atk_animation = "";
saber_end_animation = "";
saber_atk_next = false;
saber_unlocked = false;
saber_atk = noone;
saber_atk_t = 0;

saber_script = noone;

saber_scripts[saber_atks.atk1] = player_saber_atk_normal;
saber_scripts[saber_atks.jump] = player_saber_atk_jump;
saber_scripts[saber_atks.wall] = player_saber_atk_wall;

saber_atk_animations[saber_atks.atk1] = "atk1";
saber_atk_animations[saber_atks.atk2] = "atk2";
saber_atk_animations[saber_atks.atk3] = "atk3";
saber_atk_animations[saber_atks.jump] = "atk_jump";
saber_atk_animations[saber_atks.wall] = "atk_wall";

saber_atk_sounds[saber_atks.atk1] = snd_player_zero_saber_1;
saber_atk_sounds[saber_atks.atk2] = snd_player_zero_saber_1;
saber_atk_sounds[saber_atks.atk3] = snd_player_zero_saber_2;
saber_atk_sounds[saber_atks.jump] = snd_player_zero_saber_1;
saber_atk_sounds[saber_atks.wall] = snd_player_zero_saber_1;

saber_atk_sound = noone;

saber_end = noone;