var t = timer++;
if (t <= interval) {
	x = lerp(move_from.x, move_to.x, t / interval);
	y = lerp(move_from.y, move_to.y, t / interval);
}