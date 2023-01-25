nouse = 1;
dead = true;
if (instance_exists(owner)) {
	depth = owner.depth + 2;
	visible = false;
    if (owner.hp <= 0) {
		x = -4000;
		y = -4000;
	}
} else instance_destroy();
