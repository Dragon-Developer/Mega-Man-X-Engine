///@desc scr_tilemap_place_solid(layer,tilemap,cell_size)
///@param inst_layer,tile_layer,cell_size
function scr_tmap_place_solid(argument0, argument1, argument2) {
	obj_solid = obj_square_16;
	//This script is for placing object solid in your rooms and strecth it automaticly for optimisation and save working time.

	var lay  = argument0; // Layer for create solid instance
	var tmap = argument1; // The Tiles layer to get the index
	var cell = argument2; // Cell size	

	var width  = room_width  div cell;	// width of room in cell
	var height = room_height div cell;	// height of room in cell
	var first_tile_solid = 5;           //The first tile solid index in the tileset(Change it for your tileset arrangement)
	var ds_solid=ds_grid_create(width,height);      // Create a ds grid 
	ds_grid_set_region(ds_solid,0,0,width,height,0);// Set entire ds_grid to 0


	////// Store tilemap info to solid ds_grid ////// 	
	for (var xx=0; xx<width; xx++)
	{
	    for (var yy=0; yy<height; yy++)
	    {
			ds_solid[# xx,yy]=tilemap_get(tmap,xx,yy) & tile_index_mask; //Store the tilemap id	in ds_grid
		}
	}		

	////// Place  and strecth collisions instances //////  
	for (var yy=1; yy<height-1; yy++)  // yy and xx start at 1 and stop at width-height to-1 for not exceed solid ds_grid
	{
		var s = noone;
	
		for (var xx=1; xx<width-1; xx++)
	    {
			if(ds_solid[# xx,yy]>= first_tile_solid)// If the Tilemap index is indexed as solid 
			{
				if(!position_meeting((xx*cell),(yy*cell),obj_solid))// If the position is free
				{								
					/////// Create the collision mask instance and strecth xscale ///////
					s = instance_create_layer(xx*cell,yy*cell,lay,obj_solid);

					var x_next=1;			  // The variable to continue to stretch
				
					if(ds_solid[# xx+1,yy]>= first_tile_solid) // Strecth collision instance if the next right cell index is indexed as solid
					{
						while(ds_solid[# xx+x_next,yy]>= first_tile_solid) // while the  next right cell index is indexed as solid 
						{
							s.image_xscale++; // Strecth the xscale
							x_next++;	      // Add 1 to x_next variable
							if (xx + x_next >= width) break;
						}					
					}
					//////// Strecth and destroy upper instance if both xscale is the same ////////
					var up_s = instance_position(s.x,s.y-cell,obj_solid);// Check for up instance
				
					if(up_s) //If it have a up instance 
					{				
						if(up_s.image_xscale==s.image_xscale && up_s.x==s.x) // If the up instance have the same xscale and same position
						{
							s.y=up_s.y;							//Change the y position for the up instance y position
							s.image_yscale+=up_s.image_yscale;  //Add the yscale of the up instance
							instance_destroy(up_s);             //Destroy the instance of the same xscale and position 			
						}
					}								
				}
			}		
		}	    
	}
	ds_grid_destroy(ds_solid) //destroy the grid for free memory	

	/// Sorry for my english lol 
	/// Made by Francois Goulet (Goul)
	/// Thank you very much!!!!!!!!


}
