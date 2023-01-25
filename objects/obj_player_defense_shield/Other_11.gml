// Movement
var t = timer++;
if (t >= 8) {
	// Blink
	visible = (((t - 8) mod 3) == 0);	
}
if (instance_exists(owner) && owner.hp <= 0)
	t = timer_limit;
if (t >= timer_limit)
{
	if (instance_exists(owner)) {
		owner.defense_shield_enabled = true;
	}
	instance_destroy();
	exit;
}