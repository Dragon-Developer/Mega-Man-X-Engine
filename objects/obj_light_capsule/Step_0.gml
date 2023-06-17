

image_speed = 1/imgFrames;

if type == 1 {
    sprite_index = spr_light_chip_capsule;
    flashColour = c_fuchsia;
}
    
hologramFlash += 1;
if hologramFlash > 4
    hologramFlash = 0;
    
var myPlayer = instance_nearest(x, y, obj_player_parent);
if state == 0 {
    if instance_exists(myPlayer) {
        //Set what direction Dr. Light will be facing 
        hologramXscale = sign(myPlayer.x - x); //This could return a zero, but because of how you activate the capsule
                                                //this shouldn't happen.
        
        //Activating
        if myPlayer.bbox_bottom < bbox_bottom && myPlayer.bbox_top > bbox_top {
            if myPlayer.x > bbox_left-24 && myPlayer.x < bbox_right+24 {
                if (type == 0 || (type == 1 && (part == -1 /*if you already have the part, don't start goes here*/))) {
                    //if capsules are locked to their own character
					if (!global.anyone_can_get_armors){
			        //This checks who can activate it
                    if (part = FULL && (armor == "black" || armor == "nightmare" || armor == "x1") && myPlayer.is_zero)
                    || (part = FULL && armor == "white" && myPlayer.is_axl)
                    || ((armor == "x1" || armor == "x2" || armor == "x3" ||
					armor == "x4" || armor == "ult" || armor == "x8_ult" || 
					armor == "falcon") && myPlayer.is_x)
					
                        state = 1;
					}
					if (global.anyone_can_get_armors){state = 1;}
                }
            }
        }
    }
}
//Lock player and do the hologram startup
else if state == 1 {
    if instance_exists(myPlayer) //lock the player
	{
       myPlayer.locked = true;
	   with (myPlayer) 
	   {
	   //state_set(states.idle, 0, [-1]); // Set idle but wait for the next state
	   immortal = true;
       }
    }
    
    columnIndex = min(columnIndex+1,sprite_get_number(column_sprite)-1);
    if columnIndex >= sprite_get_number(column_sprite)-1 {
        //music fades out here
        hologramIndex = min(hologramIndex+1/6,sprite_get_number(hologram_sprite)-1);
            
        if hologramIndex >= sprite_get_number(hologram_sprite)-1 {
            state = 2;
            //music change here
        }
    }
    else
        hologramIndex = 0;
}
//Dialogue
else if state == 2 {
    //Create text
    if timer == 0 {
        //music plays here
        
       //dioluge box is made here
    }
    
    if timer == 0 {
        timer++;
    }
    
    //if !instance_exists(obj_dialogue) if diologue box no longer exists, continue operations
        timer++;
            
    if timer >= 2 {
        hologramIndex = max(hologramIndex-1/6,0);
        if hologramIndex <= 0 {
            hologramIndex = -1;
            state = 3;
            myPlayer.locked = false; myPlayer.immortal = false;
            // music changes back to stage theme here.
        }
    }
}
//Lock the player when entering the capsule
else if state == 3 {
    var myPlayer = collision_rectangle(x-2,y,x+2,y-76, obj_player_parent, 0, 1);
    if myPlayer {
        if instance_exists(myPlayer) //lock the player
	{
       myPlayer.locked = true;
	   with(myPlayer) 
	   {
	  // state_set(states.idle, 0, [-1]); // Set idle but wait for the next state
	   immortal = true;
       }
    }
        myPlayer.xspeed = 0;
        myPlayer.x = x;
        state = 4;
		audio_play(sfx_light_capsule_energy);
    }
}
//Effects
else if state == 4 {
	
	//added
	 Time ++;
 
 if (Time < 160 && Time > 10)
 {
  Alpha = min(Alpha + .05, 1);
 }
 else
 {
  Alpha = max(Alpha - .05, 0);
 }
	///
	
    var startEndFrame = 240;
    
    if instance_number(obj_light_capsule_particle) < 5
    && effectTimer2 < startEndFrame + 140 {
        for(var i = 0; i < 5 - instance_number(obj_light_capsule_particle); i++) {
            randomize();
            var X = random(12) * 2;
            var particle = instance_create_depth((x-12)+X, y-40,myPlayer.depth-1,obj_light_capsule_particle);
        }
    }
    
    if effectTimer2 == startEndFrame - 24 {
        var lightning = instance_create_depth(x, (y-72) - 224,depth+1, obj_light_capsule_lightning);
            lightning.myCapsule = id;
    }
    
    image_speed = 0;
    if effectTimer2 < startEndFrame + 140 + 40
        effectTimer++;
    else
        effectTimer += 0.5;
    if effectTimer >= 2 {
        if alphaNum < 3
            alphaNum++;
        else
            alphaNum = 0;
        effectTimer = 0;
    }
    
    effectTimer2++;
    if effectTimer2 >= startEndFrame {
        //Create lightning
        if effectTimer2 == startEndFrame {
            audio_play(thunderbolt);
        }
        
        effectTimer -= 0.5; //Minus some speed.
        if effectTimer2 >= startEndFrame + 140 {
           // obj_player_parent.function_state = 3;
            alphaNum = 0;
            
           //Unlock the armors for X
            if type == 0 {
			if (part==1){G.player_character_armor[pl_char.x][1] = armor;}
			if (part==2){G.player_character_armor[pl_char.x][2] = armor;}
			if (part==3){G.player_character_armor[pl_char.x][3] = armor;}
			if (part==4){G.player_character_armor[pl_char.x][4] = armor;}
            myPlayer.armor = global.player_character_armor[pl_char.x];
			myPlayer.armor_check = 1;
            }
            //Unlock the chip
            else if type == 1 {
             
            }
                
            if effectTimer2 >= startEndFrame + 140 + 40 {
                state = 5;
                myPlayer.locked = false;myPlayer.immortal = false;
            }
        }
    }
}
else if state == 5 {
    alphaNum = 0;
}

switch alphaNum {
    case(0): alpha = 1; break;
    case(1): alpha = 0.75; break;
    case(2): alpha = 0.5; break;
    case(3): alpha = 0.75; break;
}

