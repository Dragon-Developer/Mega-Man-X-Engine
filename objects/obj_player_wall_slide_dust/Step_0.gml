var t = timer;

// Destroy
if (t == 24)
{
    instance_destroy();
    exit;
}
timer++;

// Animation
animation_update();
image_index = animation_i;

