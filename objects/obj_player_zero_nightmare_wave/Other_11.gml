/// @description Step
event_inherited();
var t = timer++;
if (t == 0) {
	depth -= 10;
	x += 40*dir;
	h_speed = dir * abs_speed;
	var nearest_enemy = noone, nearest_distance = infinity;
	with (par_enemy) {
		var _dir = sign(x - other.x);
		var _distance = point_distance(x, y, other.x, other.y);
		if (other.dir == _dir && _distance < nearest_distance && !is_projectile) {
			nearest_enemy = id;
			nearest_distance = _distance;
		}
	}
	if (nearest_enemy != noone) {
		var _angle = point_direction(x, y, nearest_enemy.x, nearest_enemy.y);
		v_speed = lengthdir_y(abs_speed, _angle);
		h_speed = lengthdir_x(abs_speed, _angle);
	}
}