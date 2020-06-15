// Destroy
if (timer == 30)
{
    instance_destroy();
    exit;
}
timer++;

// Animation
animation_i = animation_t div 3;
image_index = animation_i;
animation_t++;

