/// @description Insert description here
// You can write your code in this editor

flick = !flick;
if flick == true {
	visible = !visible;
}
//counter
if (al0 >= 0)
	al0 --;
if (al1 >= 0)
    al1 --;
if (al2 >= 0)
    al2 --;
if (al3 >= 0)
    al3	--;
if (al4 >= 0)
    al4	--;

///event
if (al0 == 0){
	instance_destroy();
}

if (al1 == 0){
	instance_create_layer(x+random(39),y+random(39),layer,explode_FX);
	al1 = 40;
}

if (al2 == 0){
	instance_create_layer(x+random(-39),y+random(39),layer,explode_FX);
	al2 = 40;
}

if (al3 == 0){
	instance_create_layer(x+random(39),y+random(-39),layer,explode_FX);
	al3 = 40;
}

if (al4 == 0){
	instance_create_layer(x+random(-39),y+random(-39),layer,explode_FX);
	al4 = 100;
}

