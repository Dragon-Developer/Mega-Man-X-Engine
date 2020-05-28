// Movement
var t = timer;
if (t >= 8 && t <= 15)
{
    y += 0.5;
}
if (t == 17)
{
    instance_destroy();
    exit;
}
timer++;

// Animation
animation_update();
image_index = animation_i;

