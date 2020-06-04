scr_keys_update();

player_start();

if (locked) exit;

player_gravity();
player_fall();
player_walk();
player_dash();
player_jump();
player_wall_slide();
player_wall_jump();
player_fall();
