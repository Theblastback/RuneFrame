///@description This strictly makes the block. Does not check to see if the player's collision box is in the way
///@param Player X, Y array


// Check to see if block can be made (within range && Not in collision)
var can_make = 0;
var xx = mouse_x - tile_size;
var yy = mouse_y - tile_size;

// Check range
for (var x_dir = 0; x_dir < 3; x_dir++)
	for (var y_dir = 0; y_dir < 3; y_dir++)
		can_make = can_make || tile_collide_at_points(c_tilemap, [xx + (tile_size * x_dir), yy + (tile_size * y_dir)]);


if ( !can_make ) {
	var layer_id = layer_get_id("Sprites");
	c_make_break = layer_tilemap_get_id(layer_id);

	instance_create_layer(mouse_x, mouse_y, layer_id, o_make_block); // make_block records state of collision boxes

	// c_tilemap is the collision tilemap id
	for (var x_dir = 0; x_dir < 3; x_dir++) {
		for (var y_dir = 0; y_dir < 3; y_dir++) {
			tilemap_set_at_pixel(c_tilemap, 1, xx + (tile_size * x_dir), yy + (tile_size * y_dir));
		}
	}
}