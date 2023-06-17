/// Handle Collision
mySolid1 = instance_create_depth(bbox_left,bbox_top+5,depth+1,obj_square_16);
    mySolid1.image_xscale = 3;
    mySolid1.image_yscale = 1.5;
	
mySolid3 = instance_create_depth(bbox_left+8,y+1,depth+1,obj_square_16);
    mySolid3.image_xscale = 2;
    mySolid3.image_yscale = 1.5;

armor = "x1"; //x1,x2,x3,ult,ult_x8,etc
part = 3 //1- head, 2- body, 3- arms, 4- legs

chip = -1;
type = 0; //0 - Armor Part, 1 - Chip, 2 - Unlocking the full armor

textStart = 0;
textEnd = 2;

state = 0;
timer = 0;
imgFrames = 10;
columnIndex = 0;
hologramIndex = -1;
hologramFlash = 1;
hologramXscale = -1;
alpha = 1;
alphaNum = 0;
effectTimer = 0;
effectTimer2 = 0;
flashColour = c_aqua;

Time = 0;
Index = 0;
Saving = 0;
Active = 0;

Saved = 0;
Alpha = 0;

//sprites settings:
column_sprite = spr_light_capsule_column;
hologram_sprite = spr_light_capsule_hologram;