///@description This strictly makes the block. Does not check to see if the player's collision box is in the way
///@param Player X, Y array


// Check to see if block can be made (within range && Not in collision)
var can_make = 0;
var xx = mouse_x - tile_size;
var yy = mouse_y - tile_size;

var layer_id = layer_get_id("Collision");
var c_tilemap = layer_tilemap_get_id(layer_id);

for (var x_dir = 0; x_dir < 3; x_dir++)
	for (var y_dir = 0; y_dir < 3; y_dir++) {
		// Check if collision boxes would overlap with others
		can_make = can_make || tile_collide_at_points(c_tilemap, [xx + (tile_size * x_dir), yy + (tile_size * y_dir)]);
	}

if ( !can_make ) {
	var layer_id = layer_get_id("Sprites");
	var c_make_break = layer_tilemap_get_id(layer_id);

	var inst = instance_create_layer(mouse_x, mouse_y, layer_id, o_make_block); // make_block records state of collision boxes

	var inst = instance_position(mouse_x, mouse_y, o_make_block);
	with (inst) {
		// Check to see if newly made block is overlapping player
		if ( !block_collides_with_others(inst, o_player) /*Add other AI checks here*/ ) {
			// c_tilemap is the collision tilemap id
			for (var x_dir = 0; x_dir < 3; x_dir++) {
				for (var y_dir = 0; y_dir < 3; y_dir++) {
					tilemap_set_at_pixel(c_tilemap, 1, xx + (tile_size * x_dir), yy + (tile_size * y_dir));
				}
			}
		} else { // Invalid placement. Destroy placement
			instance_destroy();
		}
	}
}