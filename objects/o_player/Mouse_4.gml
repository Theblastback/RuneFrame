/// @description Create the placement block

var layer_id = layer_get_id("Sprites");

if ( !placement_down ) { // Redundancy check
	instance_create_layer(mouse_x, mouse_y, layer_id, o_place_block);
	placement_down = 1;
}