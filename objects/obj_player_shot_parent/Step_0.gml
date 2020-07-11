if (!is_inside_view() || destroy)
{
	if (instance_exists(owner)) owner.shots_count--;
	instance_destroy();
}