/// @description Logic

timer++;

if timer mod 2 == 1 {
    y = min(y+spd, myCapsule.y - 72);
    image_xscale = -image_xscale;
}

if timer >= 80 {
    instance_destroy();
}

